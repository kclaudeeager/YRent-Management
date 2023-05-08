//
//  GetBuildingsUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class GetBuildingsUseCaseImpl : GetBuildingsUseCase {
    
    private let repository: RentalRepository
    
    init(repository: RentalRepository) {
        self.repository = repository
    }
    func execute(companyId: String, completion: @escaping (ResultState<[Building]>) -> Void) {
        repository.getBuildings(companyId: companyId, completion: completion)
    }
}
