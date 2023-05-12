//
//  AllRoomsScreen.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation
import SwiftUI

struct AllRoomsScreen: View {
    let roomsNumber: Int
    let navController: NavController
    
    var body: some View {
        CardInfoView(
            itemCount: roomsNumber,
            itemName: "Total",
            root: Screen.home.route,
            navController: navController,
                     
            icon: {
                Image(systemName: "ellipsis")
            }()
        )
    }
}
