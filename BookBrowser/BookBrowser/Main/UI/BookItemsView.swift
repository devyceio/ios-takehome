//
//  BookView.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 02.12.2024.
//
import SwiftUI

struct BookItemsView: View {
    
    @State private var isAnimating = false
    
    private let center = (UIScreen.main.bounds.width / 2) + 250
    
    private func templateView() -> some View {
        return VStack(alignment: .leading, spacing: 22) {
            
            Text("Book").modifier(SectionTitleView())
           
            ForEach(0..<5) { _ in
                HStack(spacing: 10) {
                   
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.quaternary)
                        .frame(width: 120, height: 75)
                    
                    VStack(alignment: .leading) {
                        Text("Title")
                            .font(.subheadline.weight(.semibold))
                        Text("Author")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .redacted(reason: .placeholder)
    }
    
    var body: some View {
        templateView()
            .overlay {
                templateView()
                    .mask {
                        Rectangle()
                            .fill(
                                LinearGradient(gradient: .init(colors: [.clear, .white, .clear]), startPoint: .top, endPoint: .bottom)
                            )
                            .frame(width: UIScreen.main.bounds.height)
                            .rotationEffect(.degrees(90))
                            .offset(x: isAnimating ? center : -center)
                }
            }
            .onAppear {
                withAnimation(.easeInOut.speed(0.2).repeatForever(autoreverses: false)) {
                    isAnimating.toggle()
                }
            }
    }
}

#Preview {
    BookItemsView()
}
