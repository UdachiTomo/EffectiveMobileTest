//
//  ViewModelAllTickets.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 16.06.2024.
//

import Foundation
import Combine

final class TicketsViewModel: ObservableObject {
    @Published var state: StateLoad = .content
    @Published var allTickets: [AllTicketsModel] = []
    @Published var tickets: [TicketsOffersModel] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var selectedDate = Date()
    @Published var showAll = false
    @Published var isDatePickerShown = false
    @Published var to: String
    @Published var from: String
    private let loader: DataLoader
    private var subscriptions = Set<AnyCancellable>()
    
    init( loader: DataLoader = DataLoader(), to: String, from: String) {
        self.loader = loader
        self.to = to
        self.from = from
        fetchTickets()
        fetchAllTickets()
    }
    
    func formattedArrivalTime(_ arrivalDate: Date) -> String {
        return DateFormatter.timeFormatter.string(from: arrivalDate)
    }
    
    func fetchTickets() {
        loader.fetchTicketsOffers().sink(
            receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                if case .failure = completion {
                    self.state = .error
                }
            },
            receiveValue: { [weak self] ticketOffers in
                guard let self = self else { return }
                for ticketOffer in ticketOffers {
                    print("ID: \(ticketOffer.id)")
                    print("Авиакомпания: \(ticketOffer.title)")
                    print("Время вылета: \(ticketOffer.formattedTimeRange)")
                    print("Цена: \(ticketOffer.price.value) руб.")
                }
                self.tickets = ticketOffers
                self.state = .content
            })
        .store(in: &subscriptions)
    }
    
    func fetchAllTickets() {
        isLoading = true
        loader.fetchAllTickers()
            .sink(receiveCompletion: { [weak self] result in
                guard let self = self else { return }
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.error = error
                    print(error)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] ticketResponse in
                guard let self = self else { return }
                self.allTickets = ticketResponse.tickets
            })
            .store(in: &subscriptions)
    }
}
