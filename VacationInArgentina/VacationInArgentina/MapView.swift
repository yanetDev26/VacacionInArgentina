//
//  MapView.swift
//  VacationInArgentina
//
//  Created by Yanet Rodriguez on 23/11/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    var place: Place
    
    @State var position: MapCameraPosition
    
    var body: some View {
        Map()
    }
}

#Preview {
    MapView(place: Place.previewPlaces[0],
            position: .camera(MapCamera(
                centerCoordinate: Place.previewPlaces[0].location,
                distance: 1000,
                heading: 250,
                pitch: 80)))
}
