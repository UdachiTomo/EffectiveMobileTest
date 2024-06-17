//
//  TicketsView.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 14.06.2024.
//

import SwiftUI

struct TicketOffersView: View {
    //@ObservedObject var viewModel: ViewModelAllTickets
    let ticketOffer: TicketsOffersModel
  
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Circle()
                    .fill(Color.purple)
                    .frame(width: 20, height: 20)
                    .padding(.leading, 10)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(ticketOffer.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .lineLimit(1)
                    Text("Время вылета: \(ticketOffer.formattedTimeRange)")
                        .foregroundColor(.white)
                        .lineLimit(1)
                    Text("Цена: \(ticketOffer.price.value) руб.")
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            Divider()
                .overlay(alignment: .center) {
                    Color.appGrey6
                }
                .padding(8)
                .foregroundColor(.white)
        }
    }
}

