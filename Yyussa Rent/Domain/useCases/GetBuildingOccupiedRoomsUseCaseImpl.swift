//
//  GetBuildingOccupiedRoomsUseCaseImpl.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation

class GetBuildingOccupiedRoomsUseCaseImpl:GetBuildingOccupiedRoomsUseCase{
    private let repository: RentalRepository
    
    init(repository: RentalRepository) {
        self.repository = repository
    }
    func execute(buId: String, completion: @escaping (ResultState<[Room]>) -> Void) {
        repository.getBuildingOccupiedRooms(buildingId: buId, completion: completion)
    }
    

}
