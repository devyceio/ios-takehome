//
//  CustomModifiers.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 03.12.2024.
//
import SwiftUI

extension View {

    func roundedRectBackground() -> some View {
        modifier(RoundedRectBackground())
    }
    
    func sectionTitle() -> some View {
        modifier(SectionTitle())
    }
}

struct RoundedRectBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 12)
            .font(.footnote.weight(.semibold))
            .padding(6)
            .foregroundStyle(.orange)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct SectionTitle: ViewModifier {
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
