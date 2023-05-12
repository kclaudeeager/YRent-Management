//
//  RentalUseCases.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class RentalUseCases{
    let getRoomsUseCase : GetRoomsUseCase
    let getInvoicesUseCase : GetInvoicesUseCase
    let getPaymentsUseCase : GetPaymentsUseCase
    let getBuildingsUseCase : GetBuildingsUseCase
    let getBuildingDuePaymentsUseCase : GetBuildingDuePaymentsUseCase
    let getDuePaymentsUseCase : GetDuePaymentsUseCase
    let getBuildingDueInvoicesUseCase : GetBuildingDueInvoicesUseCase
    let getDueInvoicesUseCase : GetDueInvoicesUseCase
    let getBuildingInvoicesUseCase : GetBuildingInvoicesUseCase
    let getBuildingRoomsUseCase : GetBuildingRoomsUseCase
    let getAvailableRoomsUseCase : GetAvailableRoomsUseCase
    let getOccupiedRoomsUseCase : GetOccupiedRoomsUseCase
    let getBuildingAvailableRoomsUseCase : GetBuildingAvailableRoomsUseCase
    let getBuildingOccupiedRoomsUseCase : GetBuildingOccupiedRoomsUseCase
    
    
    init(getRoomsUseCase: GetRoomsUseCase, getInvoicesUseCase: GetInvoicesUseCase, getPaymentsUseCase: GetPaymentsUseCase, getBuildingsUseCase: GetBuildingsUseCase, getBuildingDuePaymentsUseCase: GetBuildingDuePaymentsUseCase, getDuePaymentsUseCase: GetDuePaymentsUseCase, getBuildingDueInvoicesUseCase: GetBuildingDueInvoicesUseCase, getDueInvoicesUseCase: GetDueInvoicesUseCase, getBuildingInvoicesUseCase: GetBuildingInvoicesUseCase, getBuildingRoomsUseCase: GetBuildingRoomsUseCase, getAvailableRoomsUseCase: GetAvailableRoomsUseCase, getOccupiedRoomsUseCase: GetOccupiedRoomsUseCase,getBuildingAvailableRoomsUseCase:GetBuildingAvailableRoomsUseCaseImpl,getBuildingOccupiedRoomsUseCase:GetBuildingOccupiedRoomsUseCaseImpl) {
        self.getRoomsUseCase = getRoomsUseCase
        self.getInvoicesUseCase = getInvoicesUseCase
        self.getPaymentsUseCase = getPaymentsUseCase
        self.getBuildingsUseCase = getBuildingsUseCase
        self.getBuildingDuePaymentsUseCase = getBuildingDuePaymentsUseCase
        self.getDuePaymentsUseCase = getDuePaymentsUseCase
        self.getBuildingDueInvoicesUseCase = getBuildingDueInvoicesUseCase
        self.getDueInvoicesUseCase = getDueInvoicesUseCase
        self.getBuildingInvoicesUseCase = getBuildingInvoicesUseCase
        self.getBuildingRoomsUseCase = getBuildingRoomsUseCase
        self.getAvailableRoomsUseCase = getAvailableRoomsUseCase
        self.getOccupiedRoomsUseCase = getOccupiedRoomsUseCase
        self.getBuildingAvailableRoomsUseCase=getBuildingAvailableRoomsUseCase
        self.getBuildingOccupiedRoomsUseCase=getBuildingOccupiedRoomsUseCase
    }
    
}
