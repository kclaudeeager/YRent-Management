//
//  ApiService.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

protocol ApiService {
    func getRooms(company_id: String, completion: @escaping (ResultState<[Room]>) -> Void)
    
    func getBuildingRooms(bu_id: String, completion: @escaping (ResultState<[Room]>) -> Void)
    
    func getInvoices(company_id: String, completion: @escaping (ResultState<[Invoice]>) -> Void)
    
    func getBuildingInvoices(bu_id: String, completion: @escaping (ResultState<[Invoice]>) -> Void)
    
    func getDueInvoices(company_id: String, date: String, completion: @escaping (ResultState<[Invoice]>) -> Void)
    
    func getBuildingDueInvoices(bu_id: String, date: String, completion: @escaping (ResultState<[Invoice]>) -> Void)
    
    func getPayments(company_id: String, completion: @escaping (ResultState<[Payment]>) -> Void)
    
    func getDuePayments(company_id: String, date: String, completion: @escaping (ResultState<[Payment]>) -> Void)
    
    func getBuildingDuePayments(bu_id: String, date: String, completion: @escaping (ResultState<[Payment]>) -> Void)
    
    func getBuildings(company_id: String, completion: @escaping (ResultState<[Building]>) -> Void)
    
    func getUser(userId: String, completion: @escaping (ResultState<User>) -> Void)
    
    func getCompany(company_id: String, completion: @escaping (ResultState<Company>) -> Void)
    
    func login(username: String, password: String, completion: @escaping (ResultState<Data>) -> Void)

}
