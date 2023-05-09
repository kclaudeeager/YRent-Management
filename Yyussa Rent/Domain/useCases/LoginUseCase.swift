//
//  LoginUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class LoginUseCaseImpl : LoginUseCase {
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(username: String, password: String, completion: @escaping (ResultState<User>) -> Void) {
        repository.login(username: username, password: password) { resultState in
            switch resultState {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(User.self, from: data)
                    completion(.success(content: user))
                } catch {
                    completion(.failure(error: error))
                }
            case .failure(let error):
                completion(.failure(error: error))
            case .loading:
                completion(.loading)
            }
        }

    }


}
