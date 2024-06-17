//
//  MusicFlightModel.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 14.06.2024.
//

import Foundation

struct MusicFlightModel: Codable {
    let offers: [Offer]
}

struct Offer: Codable, Identifiable {
    let id: Int
    let title, town: String
    let price: Price
}

struct Price: Codable {
    let value: Int
}
