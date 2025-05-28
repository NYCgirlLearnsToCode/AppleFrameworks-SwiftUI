//
//  ContentView.swift
//  AppleFrameworks-SwiftUI
//
//  Created by Lisa J on 5/27/25.
//

import SwiftUI

struct FrameworkGridView: View {
    
    // use @StateObject when init a new object
    // only init'd once during lifetime of container
    @StateObject var viewModel = FrameworkGridViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                // similar to collectionview, not as customizable
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
        .tint(Color(.label))
    }
}

#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
}

