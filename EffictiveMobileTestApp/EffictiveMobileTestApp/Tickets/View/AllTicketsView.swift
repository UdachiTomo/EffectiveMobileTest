//
//  AllTicketsView.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 16.06.2024.
//

import SwiftUI
struct AllTicketsView: View {
    @StateObject private var viewModel = TicketsViewModel(to: "", from: "")
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30) {
                    ForEach(viewModel.allTickets, id: \.id) { ticket in
                        VStack(alignment: .leading) {
                            Group {
                                Text("\(ticket.price.value) ₽")
                                    .offset(x: 20, y: 10)
                                    .font(.headline)
                                HStack() {
                                    Circle()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(ticket.hasTransfer ? .red : .green)
                                        .position(x: 25, y: 20)
                                    HStack {
                                        VStack {
                                            Text("\(viewModel.formattedArrivalTime(ticket.departure.date))")
                                            Text("\(ticket.departure.airport)")
                                        }
                                        .frame(width: 50)
                                        .position(x: -110, y: 20)
                                        VStack {
                                            Text("\(viewModel.formattedArrivalTime(ticket.arrival.date))")
                                            Text("\(ticket.arrival.airport)")
                                        }
                                        .frame(width: 50)
                                        .position(x: -120, y: 20)
                                        Text("\(ticket.flightDuration)ч в пути")
                                            .lineLimit(1)
                                            .frame(width: 110)
                                            .position(x: -100, y: 8.5)
                                    }
                                }
                            }
                            if ticket.hasTransfer {
                                Text("Без пересадок")
                                    .position(x: 210)
                            }
                        }
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 85)
                        .background(Color.appGrey4)
                        .cornerRadius(20)
                        .overlay(
                            VStack {
                                if let badge = ticket.badge {
                                    Text(badge)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.blue)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .offset(x: -100, y: -20)
                                }
                                Spacer()
                            }
                        )
                    }
                }
                .padding(.top, 30)
            }
            .navigationBarTitle("Москва - Сочи", displayMode: .inline)
            .background(Color.black)
            .foregroundColor(.white)
        }
    }
    
}

struct TicketListView_Previews: PreviewProvider {
    static var previews: some View {
        AllTicketsView()
    }
}
