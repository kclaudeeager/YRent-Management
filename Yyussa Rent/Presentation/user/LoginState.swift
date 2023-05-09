//
//  LoginState.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/9/23.
//

import Foundation

enum LoginState {
    case idle
    case loading
    case success(User)
    case failure(Error)
}

extension LoginState: Equatable {
    static func == (lhs: LoginState, rhs: LoginState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading, .loading):
            return true
        case (.success(let user1), .success(let user2)):
            return user1.username == user2.username
        case (.failure(let error1), .failure(let error2)):
            return error1.localizedDescription == error2.localizedDescription
        default:
            return false
        }
    }
}
