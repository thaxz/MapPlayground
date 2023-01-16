//
//  LocationsViewModel.swift
//  MapPlayground
//
//  Created by thaxz on 16/01/23.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
    
    
    
    
    
}
