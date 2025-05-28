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
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
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

struct FrameworkTitleView: View {
    
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                 .minimumScaleFactor(0.6)
        }
        .padding()
    }
}
