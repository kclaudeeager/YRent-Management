//
//  RentalRepository.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

protocol RentalRepository {
    
    func getRooms(companyId: String, completion: @escaping (ResultState<[Room]>) -> Void)
    
    func getBuildingRooms(buildingId: String, completion: @escaping (ResultState<[Room]>) -> Void)
    func getBuildingAvailableRooms(buildingId: String, completion: @escaping (ResultState<[Room]>) -> Void)
    func getBuildingOccupiedRooms(buildingId: String, completion: @escaping (ResultState<[Room]>) -> Void)
    func getInvoices(companyId: String, completion: @escaping (ResultState<[Invoice]>) -> Void)
    
    func getBuildingInvoices(buildingId: String, completion: @escaping (ResultState<[Invoice]>) -> Void)
    
    func getDueInvoices(companyId: String, date: String, completion: @escaping (ResultState<[Invoice]>) -> Void)
    
    func getBuildingDueInvoices(buildingId: String, date: String, completion: @escaping (ResultState<[Invoice]>) -> Void)
    
    func getPayments(companyId: String, completion: @escaping (ResultState<[Payment]>) -> Void)
    
    func getDuePayments(companyId: String, date: String, completion: @escaping (ResultState<[Payment]>) -> Void)
    
    func getBuildingDuePayments(buildingId: String, date: String, completion: @escaping (ResultState<[Payment]>) -> Void)
    
    func getBuildings(companyId: String, completion: @escaping (ResultState<[Building]>) -> Void)
    
    func getAvailableRooms(companyId: String, completion: @escaping (ResultState<[Room]>) -> Void)
    
    func getOccupiedRooms(companyId: String, completion: @escaping (ResultState<[Room]>) -> Void)
    
}

