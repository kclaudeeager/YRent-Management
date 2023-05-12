//
//  DasboardState.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation

enum DashboardState: Equatable {
    static func == (lhs: DashboardState, rhs: DashboardState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading, .loading):
            return true
        case let (.success(lRooms, lBuildings, lDuePayments, lDueInvoices, lAvailableRooms, lOccupiedRooms),
                  .success(rRooms, rBuildings, rDuePayments, rDueInvoices, rAvailableRooms, rOccupiedRooms)):
            return lRooms == rRooms &&
                   lBuildings == rBuildings &&
                   lDuePayments == rDuePayments &&
                   lDueInvoices == rDueInvoices &&
                   lAvailableRooms == rAvailableRooms &&
                   lOccupiedRooms == rOccupiedRooms
        case let (.failure(lError), .failure(rError)):
            return lError.localizedDescription == rError.localizedDescription
        default:
            return false
        }
    }
    
    case idle
    case loading
    case success(
        roomsState: ResultState<[Room]>,
        buildingsState: ResultState<[Building]>,
        duePaymentsState: ResultState<[Payment]>,
        dueInvoicesState: ResultState<[Invoice]>,
        availableRoomsState: ResultState<[Room]>,
        occupiedRoomsState: ResultState<[Room]>
    )
    case failure(error: Error)
}


