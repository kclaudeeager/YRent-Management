//
//  NavController.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation

class NavController: ObservableObject {
    @Published var currentScreen: Screen?
    @Published var currentScreenIndex: Int = 0
    @Published var isLeftPanelOpen: Bool = false  
      
    let screens = [
        Screen(route: "home", title: "Home", icon: "house"),
        Screen(route: "available_rooms", title: "Available", icon: "exclamationmark.triangle"),
        Screen(route: "occupied_rooms", title: "Occupied", icon: "heart"),
        Screen(route: "invoice", title: "Invoice", icon: "info.circle"),
        Screen(route: "payments", title: "Payments", icon: "hand.thumbsup")
    ]
    
    // Additional properties
    var previousScreen: Screen?
    var isPushing: Bool = false
    
    init(initialScreen: Screen?) {
        self.currentScreen = initialScreen
    }

    func navigate(to route: String) {
        // Find the screen with the matching route
        guard let screen = screens.first(where: { $0.route == route }) else {
            print("Error: Unknown route '\(route)'")
            return
        }
        
        // Update the current screen
        self.previousScreen = self.currentScreen
        self.currentScreen = screen
        self.currentScreenIndex = screens.firstIndex(where: {$0 ==  self.currentScreen}) ??  0
    }
    
    func goBack() {
        guard let previousScreen = self.previousScreen, !isPushing else {
            return
        }
        isPushing = true
        self.currentScreen = previousScreen
        self.currentScreenIndex = screens.firstIndex(where: {$0 ==  self.currentScreen}) ??  0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.isPushing = false
        }
    }
}
