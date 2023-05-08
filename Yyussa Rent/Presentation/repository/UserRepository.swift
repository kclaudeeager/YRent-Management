//
//  UserRepository.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

protocol UserRepository {
    
    func login(username: String, password: String, completion: @escaping (ResultState<Data>) -> Void)
    
    func getCompany(companyId: String, completion: @escaping (ResultState<Company>) -> Void)
    
    func getUser(userId: String, completion: @escaping (ResultState<User>) -> Void)
}
