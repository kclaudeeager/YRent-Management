//
//  AlamofireApiService.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

import Alamofire

class AlamofireApiService: ApiService {
    
    private let baseUrl: String = "https://yyussa.xode.rw/landlord/api/management.php/"
    
    func getCompany(company_id: String,completion: @escaping (ResultState<Company>) -> Void) {
           
           let url = baseUrl + "company"
           let parameters = ["company_id": company_id]
           
          request(url: url, parameters: parameters, completion: completion)
       }
    
     func login(username: String, password: String, completion: @escaping (ResultState<Data>) -> Void) {
        let url = baseUrl + "login"
        let parameters = ["username": username, "password": password]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }


    func getRooms(company_id: String, completion: @escaping (ResultState<[Room]>) -> Void) {
           let url = baseUrl + "rooms"
           let parameters = ["company_id": company_id]
           
         request(url: url, parameters: parameters, completion: completion)
       }
    
    func getBuildingRooms(bu_id: String, completion: @escaping (ResultState<[Room]>) -> Void) {
        let url = baseUrl + "rooms"
        let parameters = ["bu_id": bu_id]

        request(url: url, parameters: parameters, completion: completion)
    }

    func getInvoices(company_id: String, completion: @escaping (ResultState<[Invoice]>) -> Void) {
        let url = baseUrl + "invoices"
        let parameters = ["company_id": company_id]
        request(url: url, parameters: parameters, completion: completion)
    }
    
    func getBuildingInvoices(bu_id: String, completion: @escaping (ResultState<[Invoice]>) -> Void) {
        let url = baseUrl + "invoices"
            let parameters = ["bu_id": bu_id]
        request(url: url, parameters: parameters, completion: completion)
    }
    
    func getDueInvoices(company_id: String, date: String, completion: @escaping (ResultState<[Invoice]>) -> Void) {
        let url = baseUrl + "due_invoices"
        let parameters = ["company_id": company_id,"date": date]
        request(url: url, parameters: parameters, completion: completion)
    }
    
    func getBuildingDueInvoices(bu_id: String, date: String, completion: @escaping (ResultState<[Invoice]>) -> Void) {
        
        let url = baseUrl + "due_invoices"
        let parameters = ["bu_id": bu_id,"date": date]
        
        request(url: url, parameters: parameters, completion: completion)
    }
    
    func getPayments(company_id: String, completion: @escaping (ResultState<[Payment]>) -> Void) {
        let url = baseUrl + "payments"
        let parameters = ["company_id": company_id]
        request(url: url, parameters: parameters, completion: completion)
    }
    
    func getDuePayments(company_id: String, date: String, completion: @escaping (ResultState<[Payment]>) -> Void) {
        
        let url = baseUrl + "due_payments"
        let parameters = ["company_id": company_id,"date": date]
        request(url: url, parameters: parameters, completion: completion)
    }
    
    func getBuildingDuePayments(bu_id: String, date: String, completion: @escaping (ResultState<[Payment]>) -> Void) {
        
        let url = baseUrl + "due_payments"
        let parameters = ["bu_id": bu_id,"date": date]
        request(url: url, parameters: parameters, completion: completion)
    }
    
    func getBuildings(company_id: String, completion: @escaping (ResultState<[Building]>) -> Void) {
        let url = baseUrl + "buildings"
        let parameters = ["company_id": company_id]
        request(url: url, parameters: parameters, completion: completion)
    
    }
    
    func getUser(userId: String, completion: @escaping (ResultState<User>) -> Void) {
        let url = baseUrl + "user"
        let parameters = ["user_id": userId]
        request(url: url, parameters: parameters, completion: completion)
    }
    
    private func request<T: Decodable>(url: String, method: HTTPMethod = .get, parameters: [String: Any] = [:], completion: @escaping (ResultState<T>) -> Void) {
        completion(.loading)
        AF.request(url, method: method, parameters: parameters)
            .validate()
            .responseDecodable(of: T.self) { response in
               
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    print("Decoding error: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
    }


}
