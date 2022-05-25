//
//  LocationsListView.swift
//  MapAndSwiftUI
//
//  Created by soroush amini araste on 5/24/22.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button {
                    viewModel.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                        .padding(.vertical, 4)
                        .listRowBackground(Color.clear)
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}


extension LocationsListView {
    
    private func listRowView(location: Location) -> some View {
        HStack {
            Image(uiImage: viewModel.getFirstImageNameOfLocations(location: location))
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
