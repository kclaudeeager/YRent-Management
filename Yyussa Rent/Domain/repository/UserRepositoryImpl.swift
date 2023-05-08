//
//  UserRepositoryImpl.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    
    
    private let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }

   
    func login(username: String, password: String, completion: @escaping (ResultState<Data>) -> Void) {
        apiService.login(username: username, password: password, completion: completion)
    }

    
    func getCompany(companyId: String, completion: @escaping (ResultState<Company>) -> Void) {
        apiService.getCompany(company_id: companyId, completion: completion)
    }
    
    
   
    func getUser(userId: String, completion: @escaping (ResultState<User>) -> Void) {
        apiService.getUser(userId: userId, completion: completion)
    }
}

