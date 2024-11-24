//
//  Scrolling.swift
//  VacationInArgentina
//
//  Created by Yanet Rodriguez on 10/11/2024.
//

import SwiftUI

struct Scrolling: View {
    var body: some View {
        ScrollView {
            VStack {
                ScrollImage(image: "buenos aires")
                ScrollImage(image: "misiones")
                ScrollImage(image: "usuahia")
            }
            .padding()
        }
    }
}

#Preview {
    Scrolling()
}
