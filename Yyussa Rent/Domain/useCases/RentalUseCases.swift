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
    let getUserUseCase : GetUserUseCase
    let loginUseCase :LoginUseCase
    let getCompanyUseCase : GetCompanyUseCase
    let getBuildingDuePaymentsUseCase : GetBuildingDuePaymentsUseCase
    let getDuePaymentsUseCase : GetDuePaymentsUseCase
    let getBuildingDueInvoicesUseCase : GetBuildingDueInvoicesUseCase
    let getDueInvoicesUseCase : GetDueInvoicesUseCase
    let getBuildingInvoicesUseCase : GetBuildingInvoicesUseCase
    let getBuildingRoomsUseCase : GetBuildingRoomsUseCase
    let getAvailableRoomsUseCase : GetAvailableRoomsUseCase
    let getOccupiedRoomsUseCase : GetOccupiedRoomsUseCase
    
    init(getRoomsUseCase: GetRoomsUseCase, getInvoicesUseCase: GetInvoicesUseCase, getPaymentsUseCase: GetPaymentsUseCase, getBuildingsUseCase: GetBuildingsUseCase, getUserUseCase: GetUserUseCase, loginUseCase: LoginUseCase, getCompanyUseCase: GetCompanyUseCase, getBuildingDuePaymentsUseCase: GetBuildingDuePaymentsUseCase, getDuePaymentsUseCase: GetDuePaymentsUseCase, getBuildingDueInvoicesUseCase: GetBuildingDueInvoicesUseCase, getDueInvoicesUseCase: GetDueInvoicesUseCase, getBuildingInvoicesUseCase: GetBuildingInvoicesUseCase, getBuildingRoomsUseCase: GetBuildingRoomsUseCase, getAvailableRoomsUseCase: GetAvailableRoomsUseCase, getOccupiedRoomsUseCase: GetOccupiedRoomsUseCase) {
        self.getRoomsUseCase = getRoomsUseCase
        self.getInvoicesUseCase = getInvoicesUseCase
        self.getPaymentsUseCase = getPaymentsUseCase
        self.getBuildingsUseCase = getBuildingsUseCase
        self.getUserUseCase = getUserUseCase
        self.loginUseCase = loginUseCase
        self.getCompanyUseCase = getCompanyUseCase
        self.getBuildingDuePaymentsUseCase = getBuildingDuePaymentsUseCase
        self.getDuePaymentsUseCase = getDuePaymentsUseCase
        self.getBuildingDueInvoicesUseCase = getBuildingDueInvoicesUseCase
        self.getDueInvoicesUseCase = getDueInvoicesUseCase
        self.getBuildingInvoicesUseCase = getBuildingInvoicesUseCase
        self.getBuildingRoomsUseCase = getBuildingRoomsUseCase
        self.getAvailableRoomsUseCase = getAvailableRoomsUseCase
        self.getOccupiedRoomsUseCase = getOccupiedRoomsUseCase
    }
    
}
