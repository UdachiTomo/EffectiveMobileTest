//
//  DataLoader.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 14.06.2024.
//

import Foundation
import Combine

final class DataLoader {
    
    private static let endpointMusicEvent = URL(string: "https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd")!
    private static let endpointTicketsOffers = URL(string: "https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017")!
    private static let endpointAllTickets = URL(string: "https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf")!

    
    func fetchMusicEvenet(_ endpoint: URL = endpointMusicEvent) -> AnyPublisher<MusicFlightModel, Error> {
        URLSession.shared.dataTaskPublisher(for: endpoint)
            .map { $0.data }
            .decode(type: MusicFlightModel.self, decoder: JSONDecoder())
            .map { $0.self}
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func fetchTicketsOffers(_ endpoint: URL = endpointTicketsOffers) -> AnyPublisher<[TicketsOffersModel], Error> {
        URLSession.shared.dataTaskPublisher(for: endpoint)
            .map { $0.data }
            .decode(type: [String: [TicketsOffersModel]].self, decoder: JSONDecoder())
            .map { $0["tickets_offers"] ?? [] }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func fetchAllTickers(_ endpoint: URL = endpointAllTickets) -> AnyPublisher<TicketResponse, Error> {
        URLSession.shared.dataTaskPublisher(for: endpoint)
            .map { $0.data }
            .decode(type: TicketResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
