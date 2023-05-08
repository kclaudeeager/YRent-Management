//
//  Company.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

struct Company:Decodable{
    let cpy_ID: String
    let cmp_sn: String
    let cmp_full: String?
    let phone: String
    let address: String
}
