//
//  BackButton.swift
//  Movies
//
//  Created by Islam Elgaafary on 23/07/2023.
//

import SwiftUI

struct BackButton: View {
    
    var action: () -> Void
    
    var body: some View {
            Button(action: {
                action()
            }) {
                Image(systemName: "arrow.backward.circle.fill")
                    .foregroundColor(.black)
                    .shadow(color: .white, radius: 5)
            }
        }
}
