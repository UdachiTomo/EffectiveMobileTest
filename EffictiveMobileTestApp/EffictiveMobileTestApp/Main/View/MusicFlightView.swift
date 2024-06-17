//
//  MusicFlightView.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 13.06.2024.
//

import SwiftUI

struct MusicFlightView: View {
    var event: Offer
    var image: MusicFlightMockModel
    var body: some View {
        ZStack {
            Color.clear
                .ignoresSafeArea()
            VStack{
                Image(image.image)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .padding(4)
                    .padding(.top, 3)
                Spacer()
                VStack(alignment: .leading) {
                    Text(event.title)
                        .foregroundColor(.white)
                        .font(.custom("Montserrat-Semibold", size: 16))
                    Spacer()
                    Text(event.town)
                        .foregroundColor(.white)
                        .font(.custom("Montserrat-Regular", size: 16))
                    HStack {
                        Image(.loupe)
                            .foregroundStyle(.appGrey6)
                        Text("От \(event.price.value)₽")
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading, -70)
            }
            .frame(width: 230, height: 310, alignment: .leading)
            .background(Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
    }
}
