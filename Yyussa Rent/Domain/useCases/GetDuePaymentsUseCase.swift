//
//  GetDuePaymentsUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class GetDuePaymentsUseCaseImpl:GetDuePaymentsUseCase{
    private let repository: RentalRepository
    
    init(repository: RentalRepository) {
        self.repository = repository
    }
    
    func execute(companyId: String, date: String, completion: @escaping (ResultState<[Payment]>) -> Void) {
        repository.getDuePayments(companyId: companyId, date: date, completion: completion)
    }
}
