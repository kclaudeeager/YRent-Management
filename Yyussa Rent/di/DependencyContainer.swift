//
//  DependencyContainer.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/9/23.
//

import Foundation

class DependencyContainer {
    let apiService: ApiService
    let userRepository: UserRepository
    let rentalRepository: RentalRepository
    let loginUseCase: LoginUseCase
    let rentalUseCases: RentalUseCases
    let loginViewModel:LoginViewModel

    init() {
        apiService = AlamofireApiService()
        userRepository = UserRepositoryImpl(apiService: apiService)
        rentalRepository = RentalRepositoryImpl(apiService: apiService)
        loginUseCase = LoginUseCaseImpl(repository: userRepository)
        rentalUseCases = RentalUseCases(
            getRoomsUseCase: GetRoomsUseCaseImpl(repository: rentalRepository),
            getInvoicesUseCase: GetInvoicesUseCaseImpl(repository: rentalRepository),
            getPaymentsUseCase: GetPaymentsUseCaseImpl(repository: rentalRepository),
            getBuildingsUseCase: GetBuildingsUseCaseImpl(repository: rentalRepository),
            getUserUseCase: GetUserUseCaseImpl(repository: userRepository),
            loginUseCase: loginUseCase,
            getCompanyUseCase: GetCompanyUseCaseImpl(userRepository: userRepository),
            getBuildingDuePaymentsUseCase: GetBuildingDuePaymentsUseCaseImpl(repository: rentalRepository),
            getDuePaymentsUseCase: GetDuePaymentsUseCaseImpl(repository: rentalRepository),
            getBuildingDueInvoicesUseCase: GetBuildingDueInvoicesUseCaseImpl(repository: rentalRepository),
            getDueInvoicesUseCase: GetDueInvoicesUseCaseImpl(repository: rentalRepository),
            getBuildingInvoicesUseCase: GetBuildingInvoicesUseCaseImpl(repository: rentalRepository),
            getBuildingRoomsUseCase: GetBuildingRoomsUseCaseImpl(repository: rentalRepository),
            getAvailableRoomsUseCase: GetAvailableRoomsUseCaseImpl(repository: rentalRepository),
            getOccupiedRoomsUseCase: GetOccupiedRoomsUseCaseImpl(repository: rentalRepository)
        )
        loginViewModel=LoginViewModel(loginUseCase: loginUseCase)
    }
}
