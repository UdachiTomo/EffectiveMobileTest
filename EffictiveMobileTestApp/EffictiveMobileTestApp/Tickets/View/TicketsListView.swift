//
//  TicketsListView.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 14.06.2024.
//

import SwiftUI

struct TicketsListView: View {
    @ObservedObject var viewModel: TicketsViewModel
    @ObservedObject var searchViewModel = SearchTicketsViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        HStack {
                            Image(.aviaTickets)
                                .resizable()
                                .foregroundColor(.appGrey6)
                                .rotationEffect(.degrees(30))
                                .frame(width: 20, height: 20)
                                .offset(x: 10)
                            TextField("Откуда - Москва", text: $viewModel.from)
                                .modifier(PlaceholderStyle(showPlaceHolder: viewModel.from.isEmpty, placeholder: "Откуда - Москва"))
                                .customStyle()
                            
                        }
                        .padding(.bottom, -15)
                        Divider()
                            .overlay(alignment: .center, content: {
                                Color.appGrey6
                                    .frame(width: 250)
                                    .offset(x: 10)
                            })
                        
                        HStack {
                            Image(.loupe)
                                .resizable()
                                .foregroundColor(.appGrey6)
                                .frame(width: 20, height: 20)
                                .offset(x: 10)
                            TextField("Куда - Турция", text: $viewModel.to)
                                .modifier(PlaceholderStyle(showPlaceHolder: viewModel.to.isEmpty, placeholder: "Куда - Турция"))
                                .customStyle()
                        }
                        .padding(.top, -15)
                    }
                    .frame(width: 360, height: 120)
                    .background(.appGrey4)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 130, height: 35)
                                .foregroundStyle(.appGrey4)
                                .overlay(Image(systemName: "plus").foregroundStyle(.white).offset(x: -40))
                                .overlay(Text("Обратно").foregroundStyle(.white).offset(x: 10))
                            HStack(spacing: 2) {
                                Text(viewModel.selectedDate.formatted(.dateTime.day().month().year()))
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .padding(8)
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 15, style: .continuous).foregroundColor(.appGrey4))
                            .overlay {
                                DatePicker(selection: $viewModel.selectedDate, displayedComponents: .date) {}
                                    .labelsHidden()
                                    .environment(\.locale, Locale(identifier: "ru"))
                                    .contentShape(Rectangle())
                                    .opacity(0.011)
                            }
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 120, height: 35)
                                .foregroundStyle(.appGrey4)
                                .overlay(
                                    Image(systemName: "person").foregroundStyle(.white).offset(x: -40)
                                )
                                .overlay(
                                    Text("1, эконом").foregroundStyle(.white).offset(x: 10)
                                )
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 70, height: 35)
                                .foregroundStyle(.appGrey4)
                                .overlay(
                                    Image(.filter).foregroundStyle(.white)
                                )
                        }
                        
                    }
                    .padding()
                    VStack(alignment: .leading, spacing: 10) {
                        LazyVStack(spacing: 10) {
                            Text("Прямые рейсы")
                                .foregroundStyle(.white)
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.leading, -110)
                            ForEach(viewModel.tickets) { ticketOffer in
                                TicketOffersView(ticketOffer: ticketOffer)
                            }
                        }
                    }
                    .padding()
                    .background(Color.appGrey4)
                    .frame(width: 360)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    Button(action: {
                        
                    }, label: {
                        NavigationLink(destination: AllTicketsView()) {
                            Text("Показать все билеты")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.appBlue)
                                .cornerRadius(8)
                                .padding(.top, 10)
                        }
                    })
                    .opacity(viewModel.tickets.count > 0 ? 1.0 : 0.0)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(width: UIScreen.main.bounds.width - 40)
                    
                }
            }
        }
    }
}

#Preview {
    TicketsListView(viewModel: TicketsViewModel(to: "Cочи", from: "Москва"))
}
