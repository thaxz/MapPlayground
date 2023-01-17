//
//  LocationsListView.swift
//  MapPlayground
//
//  Created by thaxz on 16/01/23.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject var vm: LocationsViewModel
    
    
    var body: some View {
        List{
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            }
        } .listStyle(PlainListStyle())
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}
