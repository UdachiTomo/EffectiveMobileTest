//
//  MusicFlightModel.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 13.06.2024.
//

import Foundation

import Foundation
import SwiftUI

struct MusicFlightMockModel: Identifiable {
    let id = UUID()
    var band: String
    var city: String
    var image: ImageResource
    var price: String
    
    static func getMusicFlight() -> [MusicFlightMockModel] {
        [
            MusicFlightMockModel(band: "Die Antwoord", city: "Будапешт", image: ImageResource.dieAntwoord, price: "22264"),
            MusicFlightMockModel(band: "Die Antwoord", city: "Будапешт", image: ImageResource.socratLera, price: "22264"),
            MusicFlightMockModel(band: "Die Antwoord", city: "Будапешт", image: ImageResource.lambabict, price: "22264"),
        ]
    }
}

struct DestinationMockModel: Identifiable {
    let id = UUID()
    var name: String
    var image: ImageResource
    var description: String
    
    static func getDestinationPlace() -> [DestinationMockModel] {
        [
            DestinationMockModel(name: "Сочи", image: ImageResource.sochi, description: "Популярное направление"),
            DestinationMockModel(name: "Пхукет", image: ImageResource.phucket, description: "Популярное направление"),
            DestinationMockModel(name: "Стамбул", image: ImageResource.stambul, description: "Популярное направление"),
        ]
    }
}


let destinationPlace: [DestinationMockModel] = [
    DestinationMockModel(name: "Сочи", image: ImageResource.sochi, description: "Популярное направление"),
    DestinationMockModel(name: "Пхукет", image: ImageResource.phucket, description: "Популярное направление"),
    DestinationMockModel(name: "Стамбул", image: ImageResource.stambul, description: "Популярное направление"),
]
