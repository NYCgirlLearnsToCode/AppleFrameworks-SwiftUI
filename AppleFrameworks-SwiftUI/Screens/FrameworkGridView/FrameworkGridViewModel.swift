//
//  FrameworkGridViewModel.swift
//  AppleFrameworks-SwiftUI
//
//  Created by Lisa J on 5/28/25.
//

import SwiftUI

// use observable object class to broadcast changes
final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
    }
    
    @Published var isShowingDetailView = false
    @Published var tappedOnLearnMore = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}
