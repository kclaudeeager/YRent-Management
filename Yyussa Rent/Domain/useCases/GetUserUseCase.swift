//
//  GetUserUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class GetUserUseCaseImpl:GetUserUseCase{
    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(userId: String, completion: @escaping (ResultState<User>) -> Void) {
        repository.getUser(userId: userId, completion: completion)
    }
}


