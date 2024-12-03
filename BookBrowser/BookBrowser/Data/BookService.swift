//
//  BookService.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 02.12.2024.
//
import Foundation

protocol BookService {
    func getRecentBooks() async throws -> [Book]
    func getBookDetails(for id: String) async throws ->  BookDetails?
    func getSearchResults(for query: String) async throws -> [Book]
}

actor BookServiceImpl: BookService {

    private let networkManager: NetworkManager = NetworkManagerImpl(urlSession: URLSession.newInstance())
    
    func getRecentBooks() async throws -> [Book] {
        guard let url = BookAPI.recent.url else { throw BookError.malformedUrl }
        let response: BooksResponse? = try await networkManager.getRemoteData(url)
        guard let books = response?.books else { throw BookError.unexpected }
        return books
    }
    
    func getBookDetails(for id: String) async throws -> BookDetails? {
        guard let url = BookAPI.details(id: id).url else { throw BookError.unknown }
        let details: BookDetails = try await networkManager.getRemoteData(url)
        return details
    }
    
    func getSearchResults(for query: String) async throws -> [Book] {
        //TODO
        throw BookError.unknown

    }
    
}

