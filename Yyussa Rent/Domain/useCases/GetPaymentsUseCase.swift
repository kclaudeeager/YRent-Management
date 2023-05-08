//
//  GetPaymentsUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class GetPaymentsUseCaseImpl:GetPaymentsUseCase{
    private let repository: RentalRepository
    
    init(repository: RentalRepository) {
        self.repository = repository
    }
    
    func execute(companyId: String, completion: @escaping (ResultState<[Payment]>) -> Void) {
        repository.getPayments(companyId: companyId, completion: completion)
    }
}
