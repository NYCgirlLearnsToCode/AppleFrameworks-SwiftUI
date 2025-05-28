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
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                if let framework = viewModel.selectedFramework {
                    FrameworkDetailView(framework: framework,
                                        isShowingDetailView: $viewModel.isShowingDetailView)
                }
            }
        }
    }
}

#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
}

