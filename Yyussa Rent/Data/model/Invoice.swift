//
//  Invoice.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

struct Invoice:Decodable,Equatable,Identifiable{
    let id: String
    let month: String
    let amount: String
}
