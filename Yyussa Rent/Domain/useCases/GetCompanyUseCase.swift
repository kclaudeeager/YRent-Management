//
//  GetCompanyUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class GetCompanyUseCaseImpl:GetCompanyUseCase {
    
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute(companyId: String, completion: @escaping (ResultState<Company>) -> Void) {
        userRepository.getCompany(companyId: companyId, completion: completion)
    }
}
