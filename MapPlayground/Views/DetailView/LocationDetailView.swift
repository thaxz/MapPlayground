//
//  LocationDetailView.swift
//  MapPlayground
//
//  Created by thaxz on 17/01/23.
//

import SwiftUI

struct LocationDetailView: View {
    
    @EnvironmentObject var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        ScrollView{
            VStack{
                // como se fosse um carrossel
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapSection
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        } .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backButton
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}
