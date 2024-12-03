//
//  EmptyView.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 03.12.2024.
//
import SwiftUI

struct EmptView: View {
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment:.center, spacing: 16) {
                Image(systemName: "aqi.medium")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
              
                VStack(spacing: 6) {
                    Text("No data")
                        .font(.headline)

                    Text("Nothing to display.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    EmptyView()
}
