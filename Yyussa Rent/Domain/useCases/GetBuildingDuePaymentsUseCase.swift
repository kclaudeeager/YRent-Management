//
//  GetBuildingDuePaymentsUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class GetBuildingDuePaymentsUseCaseImpl:GetBuildingDuePaymentsUseCase {
    private let repository: RentalRepository
    
    init(repository: RentalRepository) {
        self.repository = repository
    }

    func execute(buId: String, date: String, completion: @escaping (ResultState<[Payment]>) -> Void) {
        repository.getBuildingDuePayments(buildingId: buId, date: date, completion: completion)
    }
}
