//
//  Extenstion + View.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 17.06.2024.
//

import SwiftUI

extension View {
    func customStyle() -> some View {
        modifier(TFStyleViewModifier())
    }
    
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}

struct ClearableTextField: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("", text: $text)
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.appGrey6)
                }
                .padding(.trailing, 8)
            }
        }
    }
}


struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .padding(.horizontal, 5)
                    .foregroundStyle(.appGrey6)
                    .font(.system(size: 21, weight: .semibold))
            }
            content
                .foregroundColor(Color.white)
                .font(.system(size: 21, weight: .semibold))
                .padding(5.0)
        }
    }
}

struct TFStyleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 300)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
