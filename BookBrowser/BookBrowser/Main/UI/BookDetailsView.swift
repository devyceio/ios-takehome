//
//  BookDetailsView.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 02.12.2024.
//
import SwiftUI

struct BookDetailsView: View {
    let book: Book
    
    var body: some View {
        List {
            Section {
                BookItemsView().listRowSeparator(.hidden)
            }
        }
        .navigationTitle("Details")
    }
}
