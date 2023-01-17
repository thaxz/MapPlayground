//
//  LocationDetailViewComponents.swift
//  MapPlayground
//
//  Created by thaxz on 17/01/23.
//

import Foundation
import SwiftUI
import MapKit

extension LocationDetailView {
    
    var imageSection: some View {
        TabView {
            // esse "\.self" é pq é um array de strings e ele conforma para hashable
            ForEach(location.imageNames, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
                // para cortar do tamanho da tab
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    var mapSection: some View {
        // valor constante pq a coordenada será fixa, a da localizacão da tela
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            // coleção de itens onde rodará um forEach para fazer os pins
            annotationItems: [location],
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                // colocando o pin personalizado
                MapAnnotationView()
                    .shadow(radius: 10)
            }
        })
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
    
    var backButton: some View {
        Button {
            // dando dismiss na sheet
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .background(.thickMaterial)
                .foregroundColor(.primary)
                .shadow(radius: 4)
                .padding()
                
        }

        
        
    }
    
}
