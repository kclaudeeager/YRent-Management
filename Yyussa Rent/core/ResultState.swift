//
//  ResultState.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

enum ResultState<T> {
    case loading
    case success(content: T)
    case failure(error: Error)
}
