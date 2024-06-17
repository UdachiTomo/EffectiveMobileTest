//
//  HardcoreElements.swift
//  EffictiveMobileTestApp
//
//  Created by udachi_tomo on 13.06.2024.
//

import Foundation
import SwiftUI

struct HardcoreElements: Identifiable {
    let id = UUID().uuidString
    var image: ImageResource
    var name: String
    var color: Color
}

let hardcoreElements: [HardcoreElements] = [
    
    HardcoreElements(image: ImageResource.route , name: "Сложный маршрут", color: .appDarkGreen),
    HardcoreElements(image: ImageResource.world , name: "Куда угодно", color: .appBlue),
    HardcoreElements(image: ImageResource.calendar , name: "Выходные     ", color: .appDarkBlue),
    HardcoreElements(image: ImageResource.world , name: "Горячие билеты", color: .appRed)
]
