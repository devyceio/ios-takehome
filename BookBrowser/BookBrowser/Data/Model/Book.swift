//
//  Book.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 02.12.2024.
//

struct Book: Decodable, Identifiable,  Hashable {
    let id: String
    let title: String
    let subtitle: String
    let authors: String
    let image: String
    let url: String
}

struct BooksResponse: Decodable {
    let status: String
    let total: Int
    let books: [Book]
}
