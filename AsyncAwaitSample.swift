import Foundation

func asyncFunction() async throws -> Data? {
    guard let url = URL(string: "https://www.naver.com") else { return nil }
    let request = URLRequest(url: url)
    let (data, response) = try await URLSession.shared.data(for: request)
    
    if let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 {
        return data
    } else {
        return nil
    }
}


Task {
    do {
        let data = try await asyncFunction()
        print(data)
    } catch {
        print(error.localizedDescription)
    }
}
