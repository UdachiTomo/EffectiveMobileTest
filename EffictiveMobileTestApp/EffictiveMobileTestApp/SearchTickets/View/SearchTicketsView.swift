//
//  SearchTicketsView.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 13.06.2024.
//

import SwiftUI

struct SearchTicketsView: View {
    @ObservedObject var viewModel = SearchTicketsViewModel()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                HStack {
                    Image(.aviaTickets)
                        .resizable()
                        .foregroundColor(.appGrey6)
                        .rotationEffect(.degrees(30))
                        .frame(width: 20, height: 20)
                        .offset(x: 10)
                    ClearableTextField(text: $viewModel.firstTextFieldValue)
                        .modifier(PlaceholderStyle(showPlaceHolder: viewModel.firstTextFieldValue.isEmpty, placeholder: "Откуда - Москва"))
                        .customStyle()
                    
                }
                .padding(.bottom, -15)
                Divider().frame(width: 250)
                    .overlay(.appGrey6)
                    .offset(x: 10)
                HStack {
                    Image(.loupe)
                        .resizable()
                        .foregroundColor(.appGrey6)
                        .frame(width: 20, height: 20)
                        .offset(x: 10)
                    ClearableTextField(text: $viewModel.secondTextFieldValue)
                        .modifier(PlaceholderStyle(showPlaceHolder: viewModel.secondTextFieldValue.isEmpty, placeholder: "Куда - Турция"))
                        .customStyle()
                }
                .padding(.top, -15)
            }
            .onSubmit {
                if viewModel.isTextFieldEmpty {
                    viewModel.isPresented = true
                } else {
                    viewModel.isPresented = false
                }
            }
            .sheet(isPresented: $viewModel.isPresented, content: {
                TicketsListView(viewModel: TicketsViewModel(to: "Cочи", from: "Москва"))
            })
            .frame(width: 360, height: 120)
            .background(.appGrey4)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .offset(y: -300)
            HStack() {
                ForEach(hardcoreElements, id: \.id) { element in
                    VStack(spacing: 10) {
                        Image(element.image)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.white)
                            .background(
                                Rectangle().frame(width: 60, height: 60)
                                    .foregroundStyle(element.color)
                                
                                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            )
                            .padding()
                        Text("\(element.name)")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .frame(width: 90)
                            .multilineTextAlignment(.center)
                    }
                    .onTapGesture {
                        if element.name == "Куда угодно" {
                            viewModel.secondTextFieldValue = "Куда угодно"
                        }
                    }
                    .padding(.top, -10)
                }
            }
            .offset(y: -170)
            VStack() {
                ForEach(destinationPlace, id: \.id) { place in
                    HStack(spacing: 20) {
                        Image(place.image)
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .frame(maxWidth: 60, maxHeight: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .padding(.leading, 20)
                        VStack(alignment: .leading) {
                            Text("\(place.name)")
                                .foregroundStyle(.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                            Text("\(place.description)")
                        }
                    }
                    .onTapGesture {
                        viewModel.secondTextFieldValue = place.name
                    }
                    
                    .padding(EdgeInsets(top: 10, leading: -70, bottom: 15, trailing: -15))
                    Divider().frame(width: 320)
                        .overlay(.appGrey6)
                        .padding(.top, -10)
                }
                .frame(width: 360)
                
            }
            .background(.appGrey4)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .position(x: 200, y: 420)
        }
    }
}

#Preview {
    SearchTicketsView(viewModel: SearchTicketsViewModel())
}
