//
//  LocationsViewModel.swift
//  MapAndSwiftUI
//
//  Created by soroush amini araste on 5/23/22.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    @Published var mapLocation: Location? {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    @Published var showLocationsList: Bool = false
    
    //show location detail sheet
    @Published var sheetLocation: Location? = nil
    
    var tempName: String {
        guard let location = mapLocation else { return "mapLocation is nil"}
        return location.name + ", " + location.cityName
    }
    
    let mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //MARK: - INITIALIZER
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first
    }
    
    //MARK: FUNCTIONS
    private func updateMapRegion(location: Location?) {
        guard let location = mapLocation else { return }
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func getFirstImageNameOfLocations(location: Location) -> UIImage {
        if let imageName = location.imageNames.first, let image = UIImage(named: imageName) {
            return image
        }
        return UIImage(systemName: "person.fill.xmark")!
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed(location: Location) {
        guard let currentLocationIndex = locations.firstIndex (where: {$0.id == location.id}) else { return }
        let nextIndex = currentLocationIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        showNextLocation(location: locations[nextIndex])
    }
}
