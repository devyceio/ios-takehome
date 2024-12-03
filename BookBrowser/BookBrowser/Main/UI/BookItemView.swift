//
//  BookItemView.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 03.12.2024.
//
import SwiftUI

struct BookItemView: View {
    
    let book: Book
    
    var body: some View {
        HStack(spacing: 10) {
            RemoteImage(url: book.image)
                .scaledToFill()
                .frame(width: 120, height: 75)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .environment(\.colorScheme, .dark)
        
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.subheadline.weight(.semibold))
                Text("Author: \(book.authors)")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    BookItemView(
        book: Book(id: "3030168778",
                   title: "Programming for Computations - Python",
                   subtitle: "A Gentle Introduction to Numerical Simulations with Python 3.6",
                   authors: "Svein Linge, Hans Petter Langtangen",
                   image: "https://www.dbooks.org/img/books/3030168778s.jpg",
                   url: "https://www.dbooks.org/programming-for-computations-python-3030168778/"
                  )
    )
}
