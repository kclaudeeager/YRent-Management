//
//  GetBuildingDueInvoicesUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation


class GetBuildingDueInvoicesUseCaseImpl:GetBuildingDueInvoicesUseCase {
    private let repository: RentalRepository
    
    init(repository: RentalRepository) {
        self.repository = repository
    }
    func execute(buId: String, date: String, completion: @escaping (ResultState<[Invoice]>) -> Void) {
        repository.getBuildingDueInvoices(buildingId: buId, date: date, completion: completion)
    }
}
