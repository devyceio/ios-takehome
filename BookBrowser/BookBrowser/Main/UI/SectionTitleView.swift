//
//  SectionTitleView.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 02.12.2024.
//
import SwiftUI

struct SectionTitleView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowInsets(.zero)
            .listRowSeparator(.hidden)
            .font(.headline)
            .foregroundStyle(.primary)
            .padding(.horizontal)
            .padding(.vertical, 10)
    }
}

extension EdgeInsets {
    static var zero: EdgeInsets {
        return .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
}
