//
//  CardInfoView.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation
import SwiftUI

struct CardInfoView: View {
    let itemCount: Int
    let itemName: String
    let root: String
    let navController: NavController
    let icon: Image

    var body: some View {
//        let cardBackgroundColor = Color.accentColor
        let textColor = Color.white
        
        VStack(alignment: .center, spacing: 8) {
              icon
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.top, 8)
                .foregroundColor(textColor)
                
            Text(itemName)
                .font(.headline)
                .foregroundColor(textColor)

            Text("\(itemCount)")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(textColor)
        }

        .padding(.all,16)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.loginBackground1, lineWidth: 0.1)
                .background(
                    Gradient(colors: [Color.loginBackground1,Color.loginBackground2])
                )
        )
        .cornerRadius(14)
        .onTapGesture {
            navController.navigate(to: root)
        }
    }
}

struct CardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CardInfoView(
            itemCount: 42,
            itemName: "My Item",
            root: "item/\(UUID().uuidString)",
            navController: NavController(initialScreen:  Screen(route: "home", title: "Home")),
            icon: {
                Image(systemName: "square.and.pencil")
            }()
        )
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray.opacity(0.2))
        .previewDevice("iPhone 12")
    }
}


