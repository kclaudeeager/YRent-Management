//
//  GetBuildingInvoicesUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class GetBuildingInvoicesUseCaseImpl:GetBuildingInvoicesUseCase {
    
    private let repository: RentalRepository
    
    init(repository: RentalRepository) {
        self.repository = repository
    }
    
    func execute(buId: String, completion: @escaping (ResultState<[Invoice]>) -> Void) {
        repository.getBuildingInvoices(buildingId: buId, completion: completion)
    }
}
