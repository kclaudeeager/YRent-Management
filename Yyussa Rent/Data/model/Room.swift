//
//  Room.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

struct Room:Decodable,Equatable,Identifiable{
    let id: String
    let name: String
    let isOccupied: Bool
}
