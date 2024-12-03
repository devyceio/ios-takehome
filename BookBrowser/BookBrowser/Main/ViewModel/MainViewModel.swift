//
//  MainViewModel.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 29.11.2024.
//
import SwiftUI
import Foundation

class MainViewModel: ObservableObject {
    
    private let bookService: BookService = BookServiceImpl()
    
    @Published var books: [Book] = []
    @Published var booksSearchResults: [Book] = []
    @Published var bookFilter: BookFilter = .byTitle
    @Published var state: LoadingState = .loading
    @Published var error: BookError? = nil
    @Published var showError = false
    
    @MainActor
    func getRecentBooks() async {
        do {
            books = try await bookService.getRecentBooks()
            booksSearchResults = books
            filterBooks()
            state = books.isEmpty ? .empty : .result
        } catch let error as BookError {
            self.error = error
            showError = true
            state = .error
        } catch {
            self.error = BookError.unknown
            showError = true
            state = .error
        }
    }
    
    @MainActor
    func filterBooks() {
        switch bookFilter {
        case .byTitle:
            booksSearchResults.sort(by: { $0.title < $1.title })
        case .byAuthor:
            booksSearchResults.sort(by: { $0.authors < $1.authors })
        }
    }
    
    @MainActor
    func searchBooks(input searchText: String) {
        if searchText.isEmpty {
            booksSearchResults = books
        } else {
            booksSearchResults = books.filter {
                $0.title.lowercased().contains(searchText.lowercased()) ||
                $0.authors.contains(searchText) ||
                $0.subtitle.contains(searchText)
            }
        }
    }
}


