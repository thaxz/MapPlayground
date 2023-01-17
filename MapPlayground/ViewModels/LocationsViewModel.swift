//
//  LocationsViewModel.swift
//  MapPlayground
//
//  Created by thaxz on 16/01/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    // toda vez que setar um valor para maplocation, vamos dar update na região
    // fazendo isso automaticamente
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Região atual no mapa
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    // O zoom
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    // mostra lista de localizações
    @Published var showLocationsList: Bool = false
    // mostrando a sheet das locations
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    // mudar a região do mapa
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    // abrir e fechar a lista com todas localizações
    func toggleLocationsList(){
        withAnimation(.easeInOut){
            showLocationsList.toggle()
        }
    }
    
    // Indo para a próxima localização ao clicar
    func showNextLocation(location: Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationsList = false
        }
    }
    
    // Indo para a próxima localização no array
    func nextButtonPressed(){
        // pegando o index atual
        // vendo qual o index é igual ao map location
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {return}
        // checando se o index é válido
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // se tiver esgotado a quantidade de itens voltar pro primeiro
            guard let firstLocation = locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        // o index é válido, indo pra ele
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
