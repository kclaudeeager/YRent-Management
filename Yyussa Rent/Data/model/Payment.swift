//
//  Payment.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

struct Payment:Decodable{
       let id: Int
       let month: String
       let amount: Double
       let date: String
}
