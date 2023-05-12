//
//  Building.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

struct Building: Decodable, Identifiable, Equatable {
    let id: String
    let name: String
    let address: String
}
