//
//  ViewModel.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 14.06.2024.
//

import Foundation
import Combine

enum StateLoad {
    case loading
    case content
    case error
}

final class ViewModel: ObservableObject {
    
    @Published var state: StateLoad = .content
    
    @Published var data: MusicFlightModel?
    
    @Published var isPresented = false
    
    @Published var fromPoint: String = ""
    
    @Published var wherePoint: String = ""
    
    @Published var lastEnteredText: String = ""
    
    private let model: TextEntryModel?
    
    private let loader: DataLoader
    
    private var subscriptions = Set<AnyCancellable>()
    
    let flightImage = MusicFlightMockModel.getMusicFlight()
    
    var authenticated = false
    
    var isTextFieldEmpty: Bool {
        wherePoint.isEmpty || fromPoint.isEmpty
    }
    
    init(with loader: DataLoader = DataLoader(), model: TextEntryModel = TextEntryModel() ) {
        self.loader = loader
        self.model = model
        fetchData()
        //textEntryInit()
    }
    
    private func textEntryInit() {
        $lastEnteredText
            .sink { [weak self] newValue in
                self?.model?.lastEnteredText = newValue
            }
            .store(in: &subscriptions)
        model?.$lastEnteredText
            .assign(to: \.lastEnteredText, on: self)
            .store(in: &subscriptions)
    }
    
    private func fetchData() {
        loader.fetchMusicEvenet().sink(
            receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                if case .failure = completion {
                    self.state = .error
                }
            },
            receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.data = data
                self.state = .content
            })
        .store(in: &subscriptions)
    }
    
}
