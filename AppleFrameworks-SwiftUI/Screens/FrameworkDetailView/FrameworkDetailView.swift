//
//  FrameworkDetailView.swift
//  AppleFrameworks-SwiftUI
//
//  Created by Lisa J on 5/27/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    let framework: Framework
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            FrameworkTitleView(framework: framework)
                .padding(.top, 24.0)
            
            
            Text(framework.description)
                .font(.body)
                .padding([.top, .leading, .trailing], 16.0)
            
            Spacer()

            Button {
                isShowingSafariView = true
            } label: {
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.red)

        }
        .fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
        .preferredColorScheme(.dark)
}
