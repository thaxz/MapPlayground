//
//  LocationsListComponents.swift
//  MapPlayground
//
//  Created by thaxz on 16/01/23.
//

import Foundation
import SwiftUI

extension LocationsListView {
    
    func listRowView(location: Location) -> some View{
        HStack{
            // se conseguir colocar a primeira imagem, coloca ela
            if let imageName = location.imageNames.first {
               Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    
    
}
