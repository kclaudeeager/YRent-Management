//
//  GetDueInvoicesUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class GetDueInvoicesUseCaseImpl:GetDueInvoicesUseCase {
    private let repository: RentalRepository
    
    init(repository: RentalRepository) {
        self.repository = repository
    }
    
    func execute(companyId: String, date: String, completion: @escaping (ResultState<[Invoice]>) -> Void) {
        repository.getDueInvoices(companyId: companyId, date: date, completion: completion)
    }
}
