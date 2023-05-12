//
//  CompanyViewModel.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation
import Combine

class UserViewModel: BaseViewModel {
    private let getUserUseCase: GetUserUseCase
    private let getCompanyUseCase: GetCompanyUseCase
    
    @Published var userResult: ResultState<User> = .loading
    @Published var companyResult: ResultState<Company> = .loading
    
    init(getUserUseCase: GetUserUseCase, getCompanyUseCase: GetCompanyUseCase) {
        self.getUserUseCase = getUserUseCase
        self.getCompanyUseCase = getCompanyUseCase
        super.init()
        cancellables = Set<AnyCancellable>()
    }
    
    func fetchUser(userId: String) {
        getUserUseCase.execute(userId: userId) { resultState in
            DispatchQueue.main.async {
                self.userResult = resultState
            }
        }
    }
    
    func fetchCompany(companyId: String) {
        getCompanyUseCase.execute(companyId: companyId) { resultState in
            DispatchQueue.main.async {
                self.companyResult = resultState
            }
        }
    }
    
    func logout(user: User) {
        // Perform the logout logic here
        // For example, you could clear the user's session or token
        // and navigate the user back to the login screen
    }
}
