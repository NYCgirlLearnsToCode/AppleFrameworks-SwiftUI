//
//  XDismissButton.swift
//  AppleFrameworks-SwiftUI
//
//  Created by Lisa J on 5/28/25.
//

import SwiftUI

struct XDismissButton: View {
    
    @Binding var isShowingModal: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                isShowingModal = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding()
    }
}

#Preview {
    XDismissButton(isShowingModal: .constant(false))
}
