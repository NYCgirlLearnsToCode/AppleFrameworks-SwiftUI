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
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(destination: FrameworkDetailView(framework: framework)) {
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

