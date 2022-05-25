//
//  MapAndSwiftUIApp.swift
//  MapAndSwiftUI
//
//  Created by soroush amini araste on 5/23/22.
//

import SwiftUI

@main
struct MapAndSwiftUIApp: App {
    
    @StateObject private var viewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
