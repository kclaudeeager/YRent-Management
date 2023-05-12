//
//  Company.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

struct Company:Decodable,Equatable{
    let cpy_ID: String
    let cmp_sn: String
    let cmp_full: String?
    let phone: String
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case cpy_ID
        case cmp_sn
        case cmp_full
        case phone
        case address
    }
}
