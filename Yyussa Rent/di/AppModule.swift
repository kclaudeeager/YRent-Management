//
//  AppModule.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/8/23.
//

import Foundation
import Cleanse

struct AppModule: Cleanse.Module {
    
    static func configure(binder: Binder<Singleton>) {
        
        binder.include(module: ApiServiceModule.self)
        binder.include(module: UserRepositoryModule.self)
        binder.include(module: RentalRepositoryModule.self)
        binder.include(module: UsecaseModule.self)
        
    }
}

class ApiServiceModule: Cleanse.Module {
    
    static func configure(binder: Binder<Singleton>) {
        
        binder.bind(ApiService.self).to(factory: AlamofireApiService.init)
    }
}

class UserRepositoryModule: Cleanse.Module {
    
    static func configure(binder: Binder<Singleton>) {
        
        binder.bind(UserRepository.self).to { (apiService: ApiService) in
            UserRepositoryImpl(apiService: apiService)
        }
    }
}

class RentalRepositoryModule: Cleanse.Module {
    
    static func configure(binder: Binder<Singleton>) {
        
        binder.bind(RentalRepository.self).to { (apiService: ApiService) in
            RentalRepositoryImpl(apiService: apiService)
        }
    }
}

class UsecaseModule: Cleanse.Module {
    static func configure(binder: Binder<Singleton>) {
        // Bind the use cases
        binder.bind(GetRoomsUseCase.self).to{(repository: RentalRepository)in
            GetRoomsUseCaseImpl(repository: repository)
        }
        binder.bind(GetInvoicesUseCase.self).to {(repository: RentalRepository)in
            GetInvoicesUseCaseImpl(repository: repository)
        }
        binder.bind(GetPaymentsUseCase.self).to {(repository: RentalRepository)in
            GetPaymentsUseCaseImpl(repository: repository)
        }
        binder.bind(GetBuildingsUseCase.self).to {(repository: RentalRepository)in
            GetBuildingsUseCaseImpl(repository: repository)
        }
        binder.bind(GetUserUseCase.self).to {(repository: UserRepository)in
            GetUserUseCaseImpl(repository: repository)
        }
        binder.bind(LoginUseCase.self).to {(repository: UserRepository)in
            LoginUseCaseImpl(repository: repository)
        }
        binder.bind(GetCompanyUseCase.self).to {(repository: UserRepository)in
            GetCompanyUseCaseImpl(userRepository: repository)
        }
        binder.bind(GetBuildingDuePaymentsUseCase.self).to {(repository: RentalRepository)in
            GetBuildingDuePaymentsUseCaseImpl(repository: repository)
        }
        binder.bind(GetDuePaymentsUseCase.self).to {(repository: RentalRepository)in
            GetDuePaymentsUseCaseImpl(repository: repository)
        }
        binder.bind(GetBuildingDueInvoicesUseCase.self).to {(repository: RentalRepository)in
            GetBuildingDueInvoicesUseCaseImpl(repository: repository)
        }
        binder.bind(GetDueInvoicesUseCase.self).to {(repository: RentalRepository)in
            GetDueInvoicesUseCaseImpl(repository: repository)
        }
        binder.bind(GetBuildingInvoicesUseCase.self).to {(repository: RentalRepository)in
            GetBuildingInvoicesUseCaseImpl(repository: repository)
        }
        binder.bind(GetBuildingRoomsUseCase.self).to {(repository: RentalRepository)in
            GetBuildingRoomsUseCaseImpl(repository: repository)
        }
        binder.bind(GetAvailableRoomsUseCase.self).to {(repository: RentalRepository)in
            GetAvailableRoomsUseCaseImpl(repository: repository)
        }
        binder.bind(GetOccupiedRoomsUseCase.self).to {(repository: RentalRepository)in
            GetOccupiedRoomsUseCaseImpl(repository: repository)
        }

        // Bind the RentalUseCases
        binder.bind(RentalUseCases.self).to { (
            getRoomsUseCase: GetRoomsUseCase,
            getInvoicesUseCase: GetInvoicesUseCase,
            getPaymentsUseCase: GetPaymentsUseCase,
            getBuildingsUseCase: GetBuildingsUseCase,
            getUserUseCase: GetUserUseCase,
            loginUseCase: LoginUseCase,
            getCompanyUseCase: GetCompanyUseCase,
            getBuildingDuePaymentsUseCase: GetBuildingDuePaymentsUseCase,
            getDuePaymentsUseCase: GetDuePaymentsUseCase,
            getBuildingDueInvoicesUseCase: GetBuildingDueInvoicesUseCase,
            getDueInvoicesUseCase: GetDueInvoicesUseCase,
            getBuildingInvoicesUseCase: GetBuildingInvoicesUseCase,
            getBuildingRoomsUseCase: GetBuildingRoomsUseCase,
            getAvailableRoomsUseCase: GetAvailableRoomsUseCase,
            getOccupiedRoomsUseCase: GetOccupiedRoomsUseCase
        ) in
            RentalUseCases(
                getRoomsUseCase: getRoomsUseCase,
                getInvoicesUseCase: getInvoicesUseCase,
                getPaymentsUseCase: getPaymentsUseCase,
                getBuildingsUseCase: getBuildingsUseCase,
                getUserUseCase: getUserUseCase,
                loginUseCase: loginUseCase,
                getCompanyUseCase: getCompanyUseCase,
                getBuildingDuePaymentsUseCase: getBuildingDuePaymentsUseCase,
                getDuePaymentsUseCase: getDuePaymentsUseCase,
                getBuildingDueInvoicesUseCase: getBuildingDueInvoicesUseCase,
                getDueInvoicesUseCase: getDueInvoicesUseCase,
                getBuildingInvoicesUseCase: getBuildingInvoicesUseCase,
                getBuildingRoomsUseCase: getBuildingRoomsUseCase,
                getAvailableRoomsUseCase: getAvailableRoomsUseCase,
                getOccupiedRoomsUseCase: getOccupiedRoomsUseCase
            )
        }
    }
}









