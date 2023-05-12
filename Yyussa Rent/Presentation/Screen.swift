//
//  Screen.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation

struct Screen: Hashable,Equatable {
    let route: String
    let title: String
    let icon: String?
    let count: Int?

    init(route: String, title: String, icon: String? = nil, count: Int? = nil) {
        self.route = route
        self.title = title
        self.icon = icon
        self.count = count
    }

    func hash(into hasher: inout Hasher) {
            hasher.combine(route)
            hasher.combine(title)
            hasher.combine(icon)
            hasher.combine(count)
        }

        static func == (lhs: Screen, rhs: Screen) -> Bool {
            return lhs.route == rhs.route &&
                lhs.title == rhs.title &&
                lhs.icon == rhs.icon &&
                lhs.count == rhs.count
        }
}


extension Screen {
    static let home = Screen(route: "home", title: "Home", icon: "house")
    static let availableRooms = Screen(route: "available_rooms", title: "Available", icon: "exclamationmark.triangle")
    static let occupiedRooms = Screen(route: "occupied_rooms", title: "Occupied", icon: "heart")
    static let invoice = Screen(route: "invoice", title: "Invoice", icon: "info.circle")
    static let payments = Screen(route: "payments", title: "Payments", icon: "hand.thumbsup")
    static let login = Screen(route: "login", title: "")
    static let splash = Screen(route: "splash", title: "")
}

