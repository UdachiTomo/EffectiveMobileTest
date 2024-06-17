//
//  TicketsOffers.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 14.06.2024.
//

import Foundation

struct TicketsOffersModel: Codable, Identifiable {
    let id: Int
    let title: String
    let timeRange: [String]
    let price: Price
    
    var formattedTimeRange: String {
        return timeRange.joined(separator: " - ")
    }
    
    private enum CodingKeys: String, CodingKey {
           case id, title, timeRange = "time_range", price
       }
}
