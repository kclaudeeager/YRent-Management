//
//  RentalRepositoryImplem.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

class RentalRepositoryImpl: RentalRepository  {
    func getBuildingAvailableRooms(buildingId: String, completion: @escaping (ResultState<[Room]>) -> Void) {
        apiService.getBuildingRooms(bu_id: buildingId){ resultState in
            switch resultState{
            case .success(let rooms):
                let availableRooms = rooms.filter { !$0.isOccupied }
                completion(.success(availableRooms))
                
            case .failure(let error):
                completion(.failure(error))
            case .loading:
                completion(.loading)
            case .idle:
                completion(.idle)
            }

        }
    }
    
    func getBuildingOccupiedRooms(buildingId: String, completion: @escaping (ResultState<[Room]>) -> Void) {
        apiService.getBuildingRooms(bu_id: buildingId){ resultState in
            switch resultState{
            case .success(let rooms):
                let availableRooms = rooms.filter { $0.isOccupied }
                completion(.success(availableRooms))
                
            case .failure(let error):
                completion(.failure(error))
            case .loading:
                completion(.loading)
            case .idle:
                completion(.idle)
            }

        }
    }
    

    private let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func getRooms(companyId: String, completion: @escaping (ResultState<[Room]>) -> Void) {
        apiService.getRooms(company_id: companyId, completion: completion)
    }
    
    func getAvailableRooms(companyId: String, completion: @escaping (ResultState<[Room]>) -> Void) {
        apiService.getRooms(company_id: companyId) { resultState in
            switch resultState{
            case .success(let rooms):
                let availableRooms = rooms.filter { !$0.isOccupied }
                completion(.success(availableRooms))
                
            case .failure(let error):
                completion(.failure(error))
            case .loading:
                completion(.loading)
            case .idle:
                completion(.idle)
            }

        }
    }

    func getOccupiedRooms(companyId: String, completion: @escaping (ResultState<[Room]>) -> Void) {
        apiService.getRooms(company_id: companyId) { resultState in
            switch resultState{
            case .success(let rooms):
                let availableRooms = rooms.filter { $0.isOccupied }
                completion(.success(availableRooms))
                
            case .failure(let error):
                completion(.failure(error))
            case .loading:
                completion(.loading)
            case .idle:
                completion(.idle)
            }

        }
    }
    
    func getInvoices(companyId: String, completion: @escaping (ResultState<[Invoice]>) -> Void) {
        apiService.getInvoices(company_id: companyId) { resultState in
        
            switch resultState{
            case .success(let invoices):
                completion(.success(invoices))
            case .failure(let error):
                completion(.failure(error))
            case .loading:
                completion(.loading)
            case .idle:
                completion(.idle)
            }
           
        }
    }

    func getBuildingRooms(buildingId: String, completion: @escaping (ResultState<[Room]>) -> Void) {
        apiService.getBuildingRooms(bu_id: buildingId, completion: completion)
    }
    
    func getBuildingInvoices(buildingId: String, completion: @escaping (ResultState<[Invoice]>) -> Void) {
        apiService.getBuildingInvoices(bu_id: buildingId, completion: completion)
    }
    
    func getDueInvoices(companyId: String, date: String, completion: @escaping (ResultState<[Invoice]>) -> Void) {
        apiService.getDueInvoices(company_id: companyId, date: date, completion: completion)
    }
    
    func getBuildingDueInvoices(buildingId: String, date: String, completion: @escaping (ResultState<[Invoice]>) -> Void) {
        apiService.getBuildingDueInvoices(bu_id: buildingId, date: date, completion: completion)
    }
    
    func getPayments(companyId: String, completion: @escaping (ResultState<[Payment]>) -> Void) {
        apiService.getPayments(company_id: companyId, completion: completion)
    }
    
    func getDuePayments(companyId: String, date: String, completion: @escaping (ResultState<[Payment]>) -> Void) {
        apiService.getDuePayments(company_id: companyId, date: date, completion: completion)
    }
    
    func getBuildingDuePayments(buildingId: String, date: String, completion: @escaping (ResultState<[Payment]>) -> Void) {
        apiService.getBuildingDuePayments(bu_id: buildingId, date: date, completion: completion)
    }
    
    func getBuildings(companyId: String, completion: @escaping (ResultState<[Building]>) -> Void) {
        apiService.getBuildings(company_id: companyId, completion: completion)
    }
   
    
}
