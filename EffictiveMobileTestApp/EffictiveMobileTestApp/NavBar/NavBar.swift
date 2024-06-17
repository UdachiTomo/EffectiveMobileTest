//
//  NavBar.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 17.06.2024.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        HStack {
            Button(action: {
                
            } , label: {
                Image(.backButton)
                    .foregroundStyle(.appBlue)
            } )
            VStack() {
                Text("Москва - Сочи")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text("23 февраля, 1 пассажир")
                    .foregroundStyle(.appGrey6)
            }
            Spacer().frame(width: 120)
        }
        .padding()
        .background(Color.appGrey4)
    }
}

#Preview {
    NavBar()
}
