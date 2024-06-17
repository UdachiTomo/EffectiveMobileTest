//
//  TabBarView.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 10.06.2024.
//

import SwiftUI

struct TabBarView: View {
    @State private var selection: String = "home"
    @StateObject var viewModel = ViewModel()
    var body: some View {
        ZStack {
            Color.black
            TabView(selection: $selection) {
                MainView()
                    .environmentObject(viewModel)
                .tabItem {
                    Image(.aviaTickets)
                    Text("Авиабилеты")
                }
                PlugView()
                .tabItem {
                    Image(.hotels)
                    Text("Отели")
                }
                PlugView()
                .tabItem {
                    Image(.location)
                    Text("Короче")
                }
                PlugView()
                .tabItem {
                    Image(.subscription)
                    Text("Подписки")
                }
                PlugView()
                .tabItem {
                    Image(.profile)
                    Text("Профиль")
                }
            }
        }
    }
}

#Preview {
    TabBarView()
}
