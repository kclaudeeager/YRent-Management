//
//  User.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

struct User: Decodable {
    let acc_id: String
    let l_name: String
    let f_name: String
    let username: String
    let role_id: String
    let co_id: String
    let side: String
    let mobile: String
    
    enum CodingKeys: String, CodingKey {
        case acc_id
        case l_name
        case f_name
        case username
        case role_id
        case co_id
        case side
        case mobile
    }
}
