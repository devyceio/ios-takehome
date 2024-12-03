//
//  NetworkManager.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 02.12.2024.
//

import Foundation

actor NetworkManagerImpl: NetworkManager {
    
    private let decoder: JSONDecoder = JSONDecoder()
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func getRemoteData<T: Decodable>(_ url: URL) async throws -> T {
        let (data, response) = try await urlSession.data(for: request(url))
        
        guard let httpResponse = response as? HTTPURLResponse else { throw URLError(.badServerResponse) }
        
        guard httpResponse.statusCode == 200 else {
            switch httpResponse.statusCode {
            case 100..<200:
                throw URLError(.unknown)
            case 300..<400:
                throw URLError(.redirectToNonExistentLocation)
            case 400..<500:
                throw URLError(.fileDoesNotExist)
            case 500..<600:
                throw URLError(.badServerResponse)
            default:
                throw URLError(.unknown)
            }
        }
        return try decoder.decode(T.self, from: data)
    }
    
    private func request(_ url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.cachePolicy = .returnCacheDataElseLoad
        return request
    }
}

protocol NetworkManager {
    func getRemoteData<T: Decodable>(_ url: URL) async throws -> T
}
