//
//  LocationsView.swift
//  MapPlayground
//
//  Created by thaxz on 16/01/23.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject var vm: LocationsViewModel
    
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            VStack{
                
                header
                .padding()
                
                Spacer()
                
            }
            
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
