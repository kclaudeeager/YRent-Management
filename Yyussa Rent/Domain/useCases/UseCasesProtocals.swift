//
//  UseCasesProtocals.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation

protocol GetRoomsUseCase {
    func execute(companyId: String, completion: @escaping (ResultState<[Room]>) -> Void)
}

protocol GetInvoicesUseCase {
    func execute(companyId: String, completion: @escaping (ResultState<[Invoice]>) -> Void)
}

protocol GetPaymentsUseCase {
    func execute(companyId: String, completion: @escaping (ResultState<[Payment]>) -> Void)
}

protocol GetBuildingsUseCase {
    func execute(companyId: String, completion: @escaping (ResultState<[Building]>) -> Void)
}

protocol GetUserUseCase {
    func execute(userId: String, completion: @escaping (ResultState<User>) -> Void)
}

protocol LoginUseCase{
    func execute(username: String, password: String, completion: @escaping (ResultState<User>) -> Void)
}

protocol GetCompanyUseCase{
    func execute(companyId: String, completion: @escaping (ResultState<Company>) -> Void)
}

protocol GetBuildingDuePaymentsUseCase {
    func execute(buId: String, date: String, completion: @escaping (ResultState<[Payment]>) -> Void)
}

protocol GetDuePaymentsUseCase {
    func execute(companyId: String, date: String, completion: @escaping (ResultState<[Payment]>) -> Void)
}

protocol GetBuildingDueInvoicesUseCase {
    func execute(buId: String, date: String, completion: @escaping (ResultState<[Invoice]>) -> Void)
}

protocol GetDueInvoicesUseCase {
    func execute(companyId: String, date: String, completion: @escaping (ResultState<[Invoice]>) -> Void)
}

protocol GetBuildingInvoicesUseCase {
    func execute(buId: String, completion: @escaping (ResultState<[Invoice]>) -> Void)
}

protocol GetBuildingRoomsUseCase {
    func execute(buId: String, completion: @escaping (ResultState<[Room]>) -> Void)
}

protocol GetAvailableRoomsUseCase{
    func execute(companyId: String, completion: @escaping (ResultState<[Room]>) -> Void)
}

protocol GetOccupiedRoomsUseCase{
    func execute(companyId: String, completion: @escaping (ResultState<[Room]>) -> Void)
}
