//
//  ProfileAndSettings.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/11/23.
//

import Foundation
import SwiftUI

struct ProfileAndSettings: View {
    let user: User?
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        VStack {
            if let user = user {
                ProfileDetails(user: user)
            }
            
            Section(header: Text("Theme")) {
                Toggle("Dark Mode", isOn: $isDarkMode)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .onChange(of: isDarkMode) { _ in
            if isDarkMode {
                UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .first?.windows
                    .forEach { window in
                        window.overrideUserInterfaceStyle = .dark
                    }
            } else {
                UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .first?.windows
                    .forEach { window in
                        window.overrideUserInterfaceStyle = .light
                    }
            }
        }

    }
}
