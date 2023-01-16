//
//  MapPlaygroundApp.swift
//  MapPlayground
//
//  Created by thaxz on 16/01/23.
//

import SwiftUI

@main
struct MapPlaygroundApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
