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
        LoginView(viewModel: dependencyContainer.loginViewModel)

    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


