//
//  ContentView.swift
//  VacationInArgentina
//
//  Created by Yanet Rodriguez on 07/11/2024.
//

import SwiftUI
import SwiftData

struct ScrollImage: View {
    let image: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
            .scrollTransition { content, phase in
                content
                    .scaleEffect(phase.isIdentity ? 1 : 0.75)
                    .opacity(phase.isIdentity ? 1 : 0.75)
            }
    }
}

#Preview {
    ScrollImage(image: "buenosAires")
}
