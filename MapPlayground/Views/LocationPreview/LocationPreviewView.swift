//
//  LocationPreviewView.swift
//  MapPlayground
//
//  Created by thaxz on 16/01/23.
//

import SwiftUI

struct LocationPreviewView: View {
    
    let location: Location
    @EnvironmentObject var vm: LocationsViewModel
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            VStack(spacing: 8){
                learnMoreButton
                nextButton
            }
        } .padding(20)
            .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
            )
            .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}
