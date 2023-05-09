//
//  ContentView.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/4/23.
//

import SwiftUI


struct ContentView: View {
    @State private var isPresentingLogin = false
    let dependencyContainer = DependencyContainer()
    var body: some View {
        Button("Show Login") {
            isPresentingLogin = true
        }
        .sheet(isPresented: $isPresentingLogin) {
            LoginView(viewModel: dependencyContainer.loginViewModel)
        }
    }
}


