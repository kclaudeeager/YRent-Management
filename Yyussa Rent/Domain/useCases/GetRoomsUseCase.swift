//
//  GetRoomsUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class GetRoomsUseCaseImpl : GetRoomsUseCase {
    private let repository: RentalRepository
    
    init(repository: RentalRepository) {
        self.repository = repository
    }

    func execute(companyId: String, completion: @escaping (ResultState<[Room]>) -> Void) {
        repository.getRooms(companyId: companyId, completion: completion)
    }
}






