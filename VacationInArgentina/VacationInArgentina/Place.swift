//
//  Place.swift
//  VacationInArgentina
//
//  Created by Yanet Rodriguez on 07/11/2024.
//

import MapKit
import SwiftUI
import SwiftData

@Model
class Place {
    #Unique<Place>([\.name, \.latitude, \.longitude])
    
    @Attribute(.unique) var name: String
    var latitude: Double
    var longitude: Double
    var interested: Bool
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var image: Image {
        Image(name.lowercased())
    }
    
    init(name: String, latitude: Double, longitude: Double, interested: Bool) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.interested = interested
    }
    
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Place.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        for place in previewPlaces {
            container.mainContext.insert(place)
        }
        
        return container
    }
    
    static var previewPlaces: [Place] {
        [
            Place(name: "Buenos Aires", latitude: 34.37, longitude: 58.25, interested: true),
            Place(name: "Misiones", latitude: 34.37, longitude: 58.25, interested: true),
            Place(name: "Usuahia", latitude: 34.37, longitude: 58.25, interested: false)
        ]
    }
}
