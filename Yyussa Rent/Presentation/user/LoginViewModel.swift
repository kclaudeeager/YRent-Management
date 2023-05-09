//
//  LoginViewModel.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/9/23.
//

import Foundation
import Combine


class LoginViewModel: BaseViewModel {
    
    private let loginUseCase: LoginUseCase
    @Published  var state: LoginState = .idle {
        didSet {
            stateDidChange?(state)
        }
    }
    
    var stateDidChange: ((LoginState) -> Void)?
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isFormValid: Bool = true
    @Published var didTapLoginButton: Bool = false // new property
    
    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }
    
    private func validateForm() {
        isFormValid = isValidUsername(username) && isValidPassword(password)
    }
    
    func login() {
        validateForm()
        
        guard isFormValid else {
            state = .failure(LoginError.invalidCredentials)
            return
        }
        
        didTapLoginButton = true // set to true when login button is tapped
        
        state = .loading
        loginUseCase.execute(username: username, password: password) { resultState in
            switch resultState {
            case .success(let user):
                self.state = .success(user)
            case .failure(let error):
                self.state = .failure(error)
            case .loading:
                self.state = .loading
            }
        }
    }
    
    private func isValidUsername(_ username: String) -> Bool {
        return !username.isEmpty
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
}

enum LoginError: Error {
    case invalidCredentials
}
