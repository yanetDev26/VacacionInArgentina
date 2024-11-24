//
//  PlaceList.swift
//  VacationInArgentina
//
//  Created by Yanet Rodriguez on 10/11/2024.
//

import SwiftUI
import SwiftData

struct PlaceList: View {
    @Query(sort: \Place.name) private var places: [Place]
    
    @State private var showImages: Bool = false
    @State private var searchPlace = ""
    @State private var filterByInterested: Bool = false
    
    private var predicate: Predicate<Place> {
        #Predicate<Place> {
            if !searchPlace.isEmpty && filterByInterested {
                $0.name.localizedStandardContains(searchPlace) && $0.interested
            } else if !searchPlace.isEmpty {
                $0.name.localizedStandardContains(searchPlace)
            } else if filterByInterested {
                $0.interested
            } else {
                true
            }
        }
    }
    
    var body: some View {
        VStack {
            NavigationStack {
                List((try? places.filter(predicate)) ?? places) { place in
                    HStack {
                        place.image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(7)
                            .frame(width: 100, height: 100)
                        
                        Text(place.name)
                        
                        Spacer()
                        
                        if place.interested {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundStyle(.yellow)
                        }
                    }
                }
                .navigationTitle("Lugares")
                
                .searchable(text: $searchPlace, prompt: "Buscar un lugar")
                
                .animation(.bouncy, value: searchPlace)
                
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Show Images", systemImage: "photo") {
                            showImages.toggle()
                        }
                    }
                }
                
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Filter", systemImage: filterByInterested ? "star.fill" : "star") {
                            withAnimation {
                                filterByInterested.toggle()
                            }
                        }
                        .tint(.yellow)
                    }
                }
                
                .sheet(isPresented: $showImages) {
                    Scrolling()
                }
            }
        }
    }
}

#Preview {
    PlaceList()
        .modelContainer(Place.preview)
}
