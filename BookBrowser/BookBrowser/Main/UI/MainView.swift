//
//  MainView.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 29.11.2024.
//
import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel: MainViewModel = MainViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                switch viewModel.state {
                case .loading:
                    Section {
                        BookItemsView().listRowSeparator(.hidden)
                    }
                case .result:
                    Section {
                        ForEach(viewModel.booksSearchResults) { book in
                            bookRow(for: book)
                        }
                        .listRowSeparator(.hidden)
                    }
                    header: {
                        HStack {
                            Text("Books")
                            Text(viewModel.booksSearchResults.count, format: .number)
                                .roundedRectBackground()
                        }
                        .sectionTitle()
                    }
                case .empty, .error :
                    Section {
                        EmptyView()
                            .padding(.top)
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Books")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .toolbar {
                
            }
            .task {
                guard viewModel.state == .loading else { return }
                await viewModel.getRecentBooks()
            }
            .refreshable {
                await viewModel.getRecentBooks()
            }
            .onChange(of: searchText) { value in
                viewModel.searchBooks(input: value)
            }
            .alert(viewModel.error?.title ?? BookError.unknown.title, isPresented: $viewModel.showError) {
                Button("Ok") {
                    viewModel.error = nil
                }
            } message: {
                Text(viewModel.error?.message ?? BookError.unknown.message)
            }
        }
    }
    
    private func bookRow(for book: Book) -> some View {
        NavigationLink {
            BookDetailsView(book: book)
        } label: {
            BookItemView(book: book)
        }
        .accessibilityIdentifier("Book: \(book.title)")
    }
}


#Preview {
    MainView()
}
