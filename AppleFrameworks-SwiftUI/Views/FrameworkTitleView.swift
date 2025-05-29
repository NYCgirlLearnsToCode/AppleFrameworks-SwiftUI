//
//  FrameworkTitleView.swift
//  AppleFrameworks-SwiftUI
//
//  Created by Lisa J on 5/28/25.
//

import SwiftUI

struct FrameworkTitleView: View {
    
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 75, height: 75)
            Text(framework.name)
                .font(.title2)
                .foregroundStyle(Color(.label))
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .padding()
        }
    }
}

#Preview {
    FrameworkTitleView(framework: MockData.sampleFramework)
}
