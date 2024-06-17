//
//  PlugView.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 17.06.2024.
//

import SwiftUI

struct PlugView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Привет скоро здесь будет новый экран")
                    .foregroundStyle(.white)
                Image(systemName: "airplane.departure")
                    .foregroundStyle(.white)
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    PlugView()
}
