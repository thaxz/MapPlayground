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
            mapLayer
                .ignoresSafeArea()
            VStack{
                header
                    .padding()
                Spacer()
                locationPreviewStack
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
