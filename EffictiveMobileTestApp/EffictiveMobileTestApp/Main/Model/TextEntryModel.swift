//
//  LastEnteredText.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 17.06.2024.
//
import SwiftUI
import Combine

class TextEntryModel: ObservableObject {
    
    @Published var lastEnteredText: String {
        didSet {
            UserDefaults.standard.set(lastEnteredText, forKey: "lastEnteredText")
        }
    }

    init() {
        self.lastEnteredText = UserDefaults.standard.string(forKey: "lastEnteredText") ?? "Москва"
    }
}
