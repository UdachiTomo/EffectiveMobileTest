//
//  SearchTicketsViewModel.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 17.06.2024.
//

import Foundation
import Combine

final class SearchTicketsViewModel: ObservableObject {
    @Published var state: StateLoad = .content
    @Published var firstTextFieldValue: String = ""
    @Published var secondTextFieldValue: String = ""
    @Published var isPresented = false
    
    var isTextFieldEmpty: Bool {
        !firstTextFieldValue.isEmpty && !secondTextFieldValue.isEmpty
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
}
