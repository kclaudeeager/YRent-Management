//
//  GetInvoicesUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class GetInvoicesUseCaseImpl: GetInvoicesUseCase {
    private let repository: RentalRepository
    
    init(repository: RentalRepository) {
        self.repository = repository
    }

    func execute(companyId: String, completion: @escaping (ResultState<[Invoice]>) -> Void) {
        repository.getInvoices(companyId: companyId, completion: completion)
    }
}
