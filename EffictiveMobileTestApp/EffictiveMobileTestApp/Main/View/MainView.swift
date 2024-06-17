//
//  ContentView.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 10.06.2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = ViewModel()
    
    @AppStorage("lastEnteredText") private var lastEnteredText: String = ""

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Поиска дешевых авиабилетов!")
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                ZStack {
                    RoundedRectangle(cornerRadius: 15).frame(width: 360, height: 160)
                        .foregroundColor(.secondary)
                    ZStack {
                        RoundedRectangle(cornerRadius: 15).frame(width: 320, height: 120)
                            .foregroundColor(.secondary)
                        HStack {
                            Image(.loupe)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.appGrey6)
                                .offset(x: 28)
                            VStack(spacing: -5) {
                                ClearableTextField(text: $viewModel.fromPoint)
                                    .modifier(PlaceholderStyle(showPlaceHolder: viewModel.fromPoint.isEmpty, placeholder: "Откуда - Москва"))
                                    .customStyle()
                                    .onTapGesture(perform: {
                                        self.viewModel.isPresented = true
                                    })
                                    .sheet(isPresented: $viewModel.isPresented, content: {
                                        SearchTicketsView(viewModel: SearchTicketsViewModel())
                                    })
                                Divider().frame(width: 250)
                                    .overlay(.appGrey6)
                                    .offset(x: -5)
                                ClearableTextField(text: $viewModel.wherePoint)
                                    .modifier(PlaceholderStyle(showPlaceHolder: viewModel.wherePoint.isEmpty, placeholder: "Куда - Турция"))
                                    .customStyle()
                            }
                            .offset(x: 15)
                            Spacer()
                        }
                    }
                }
                .offset(x: 5)
                .padding()
                Text("Музыкально отлететь")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .offset(x: -35)
                    .padding(.top, 40)
                
                if let model = viewModel.data {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(model.offers.indices, id: \.self) { index in
                                MusicFlightView(event: model.offers[index], image: viewModel.flightImage[index])
                            }
                        }
                        .offset(x: 15)
                        .padding(.bottom, 50)
                    }
                } else {
                    Text("Загрузка")
                        .padding(.top, 100)
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
