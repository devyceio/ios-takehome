//
//  BookDetails.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 02.12.2024.
//
import Foundation

struct BookDetails: Decodable {
    let status: String
    let id: String
    let title: String
    let subtitle: String
    let description: String
    let authors: String
    let publisher: String
    let pages: String
    let year: String
    let image: String
    let url: String
    let download: String
}
