//
//  Room.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

struct Room:Decodable{
    let id: Int
    let name: String
    let isOccupied: Bool
}
