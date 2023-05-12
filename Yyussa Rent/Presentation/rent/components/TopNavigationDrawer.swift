//
//  TopNavigationDrawer.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/11/23.
//

import Foundation

import SwiftUI

struct TopNavigationDrawer: View {

    let drawerState: Binding<Bool>
    let onLogout: () -> Void
    let user: User
    let companyName: String

    @State private var isProfileSectionExpanded = false

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: { drawerState.wrappedValue.toggle() }) {
                    Image(systemName: "line.horizontal.3")
                }
                .foregroundColor(.primary)
                .padding(.leading, 16)
                Spacer()
                Text(companyName)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.trailing, 16)
            }
            .frame(height: 44)
            .background(Color(.systemBackground))
            .shadow(color: .gray, radius: 2, x: 0, y: 2)

            List {
                Section(header: Text("Menu")) {
                    Button(action: {
                        isProfileSectionExpanded.toggle()
                    }) {
                        HStack {
                            Label("Profile and Settings", systemImage: "person.circle")
                            Spacer()
                            Image(systemName: isProfileSectionExpanded ? "chevron.up" : "chevron.down")
                        }
                    }

                    if isProfileSectionExpanded {
                        ProfileAndSettings(user: user)
                    }
                    Button(action: { onLogout() }) {
                        Label("Logout", systemImage: "arrow.right.square")
                    } 
                       
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("")
        }
    }
}




