//
//  GetOccupiedRoomsUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class GetOccupiedRoomsUseCaseImpl:GetOccupiedRoomsUseCase{
    
    private let repository: RentalRepository
    
    init(repository: RentalRepository) {
        self.repository = repository
    }
    func execute(companyId: String, completion: @escaping (ResultState<[Room]>) -> Void) {
        repository.getOccupiedRooms(companyId: companyId, completion: completion)
    }
}
