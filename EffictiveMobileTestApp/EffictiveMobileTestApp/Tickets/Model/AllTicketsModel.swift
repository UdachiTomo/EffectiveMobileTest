//
//  AllTicketsModel.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 16.06.2024.
//

import Foundation

struct TicketResponse: Codable {
    let tickets: [AllTicketsModel]
}

struct AllTicketsModel: Codable {
    let id: Int
    let badge: String?
    let price: Price
    let providerName, company: String
    let departure, arrival: Arrival
    let hasTransfer, hasVisaTransfer: Bool
    let luggage: Luggage
    let handLuggage: HandLuggage
    let isReturnable, isExchangable: Bool
    
    var flightDuration: String {
          let timeInterval = arrival.date.timeIntervalSince(departure.date)
          let hours = Int(timeInterval / 3600)
          let minutes = Int((timeInterval.truncatingRemainder(dividingBy: 3600)) / 60)
          return String(format: "%02d:%02d", hours, minutes)
      }

    enum CodingKeys: String, CodingKey {
        case id, badge, price
        case providerName = "provider_name"
        case company, departure, arrival
        case hasTransfer = "has_transfer"
        case hasVisaTransfer = "has_visa_transfer"
        case luggage
        case handLuggage = "hand_luggage"
        case isReturnable = "is_returnable"
        case isExchangable = "is_exchangable"
    }
}

struct Luggage: Codable {
    let hasLuggage: Bool
    let price: Price?
    
    enum CodingKeys: String, CodingKey {
        case hasLuggage = "has_luggage"
        case price
    }
}

struct HandLuggage: Codable {
    let hasHandLuggage: Bool
    let size: String?
    
    enum CodingKeys: String, CodingKey {
        case hasHandLuggage = "has_hand_luggage"
        case size
    }
}


struct Arrival: Codable {
    let town: String
    let date: Date
    let airport: String
    
    enum CodingKeys: String, CodingKey {
            case town, date, airport
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            town = try container.decode(String.self, forKey: .town)
            airport = try container.decode(String.self, forKey: .airport)
            
            let dateString = try container.decode(String.self, forKey: .date)
            if let date = DateFormatter.iso8601.date(from: dateString) {
                self.date = date
            } else {
                throw DecodingError.dataCorruptedError(forKey: .date, in: container, debugDescription: "Date string does not match expected format.")
            }
        }
}


