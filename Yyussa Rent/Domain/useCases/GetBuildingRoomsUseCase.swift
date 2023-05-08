//
//  GetBuildingRoomsUseCase.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class GetBuildingRoomsUseCaseImpl:GetBuildingRoomsUseCase {
    private let repository: RentalRepository
    
    init(repository: RentalRepository) {
        self.repository = repository
    }
    
    func execute(buId: String, completion: @escaping (ResultState<[Room]>) -> Void) {
        repository.getBuildingRooms(buildingId: buId, completion: completion)
    }
}
