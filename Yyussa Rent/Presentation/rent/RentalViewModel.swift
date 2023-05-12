//
//  RentalViewModel.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation

import Foundation

import Combine

class RentalViewModel: BaseViewModel {
    
    private let rentalUseCases: RentalUseCases
    
    @Published var roomsState: ResultState<[Room]> = .idle {
        didSet {
            updateDashboardState()
        }
    }

    @Published var availableRoomsState: ResultState<[Room]> = .idle {
        didSet {
            updateDashboardState()
        }
    }

   
    @Published var occupiedRoomsState: ResultState<[Room]>  = .idle {
        didSet {
            updateDashboardState()
        }
    }

    @Published var dueInvoicesState: ResultState<[Invoice]>  = .idle  {
        didSet {
            updateDashboardState()
        }
    }

    @Published var duePaymentsState: ResultState<[Payment]>  = .idle  {
        didSet {
            updateDashboardState()
        }
    }

    @Published var buildingsState: ResultState<[Building]>  = .idle {
        didSet {
            updateDashboardState()
        }
    }

    @Published var invoicesState: ResultState<[Invoice]> = .idle
    @Published var buildingRoomsState: ResultState<[Room]> = .idle
    @Published var buildingInvoicesState: ResultState<[Invoice]> = .idle
    @Published var buildingDueInvoicesState: ResultState<[Invoice]> = .idle
    @Published var paymentsState: ResultState<[Payment]> = .idle
    @Published var buildingDuePaymentsState: ResultState<[Payment]> = .idle
    @Published var buildingAvailableRoomsState: ResultState<[Room]> = .idle
    @Published var buildingOccupiedRoomsState: ResultState<[Room]> = .idle

    @Published var dashboardState: DashboardState = .idle  {
            didSet {
                print("Dashboard state updated to: \(dashboardState)")
            }
        }
    
    init(rentalUseCases: RentalUseCases) {
        self.rentalUseCases = rentalUseCases
        super.init()
        cancellables = Set<AnyCancellable>()
    }
    
    private func updateDashboardState() {
        if case .loading = roomsState,
           case .loading = buildingsState,
           case .loading = duePaymentsState,
           case .loading = dueInvoicesState,
           case .loading = availableRoomsState,
           case .loading = occupiedRoomsState {
            dashboardState = .loading
        } else if case .failure(let error) = roomsState,
                  case .failure = buildingsState,
                  case .failure = duePaymentsState,
                  case .failure = dueInvoicesState,
                  case .failure = availableRoomsState,
                  case .failure = occupiedRoomsState {
                      dashboardState = .failure(error: error)
              }

        else{
            dashboardState = .success(
                roomsState: roomsState,
                buildingsState: buildingsState,
                duePaymentsState: duePaymentsState,
                dueInvoicesState: dueInvoicesState,
                availableRoomsState: availableRoomsState,
                occupiedRoomsState: occupiedRoomsState
            )
        }
    }


    func getRooms(company_id: String) {
        roomsState = .loading
        
        rentalUseCases.getRoomsUseCase.execute(companyId: company_id) { [weak self] resultState in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.roomsState = resultState
            }
      
           
         
        }
    }
    
    func getBuildingRooms(bu_id: String) {
        buildingRoomsState = .loading
        
        rentalUseCases.getBuildingRoomsUseCase.execute(buId: bu_id) { [weak self] resultState in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.buildingRoomsState = resultState
            }
      
         
        }
    }
    
    func getInvoices(company_id: String) {
        invoicesState = .loading
        
        rentalUseCases.getInvoicesUseCase.execute(companyId: company_id) { [weak self] resultState in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.invoicesState = resultState
            }
      
         
        }
    }
    
    func getBuildingInvoices(bu_id: String) {
        buildingInvoicesState = .loading
        
        rentalUseCases.getBuildingInvoicesUseCase.execute(buId: bu_id) { [weak self] resultState in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.buildingInvoicesState = resultState
            }
            

        }
    }
    
    func getDueInvoices(companyId:String, date:String){
        dueInvoicesState = .loading
        rentalUseCases.getDueInvoicesUseCase.execute(companyId: companyId, date: date) { [weak self] resultState in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.dueInvoicesState = resultState
            }
            
        }
    }
    
    func getBuildings(company_id: String) {
        buildingsState = .loading
        
        rentalUseCases.getBuildingsUseCase.execute(companyId: company_id) { [weak self] resultState in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.buildingsState = resultState
            }
        }
    }
    
    func getAvailableRooms(company_id: String) {
        availableRoomsState = .loading
        
        rentalUseCases.getAvailableRoomsUseCase.execute(companyId: company_id) { [weak self] resultState in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.availableRoomsState = resultState
            }
        }
    }
    
    func getOccupiedRooms(company_id: String) {
        occupiedRoomsState = .loading
        
        rentalUseCases.getOccupiedRoomsUseCase.execute(companyId: company_id) { [weak self] resultState in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.occupiedRoomsState = resultState
            }
        }
    }
    
    func getDuePayments(companyId:String, date:String){
        duePaymentsState = .loading
        rentalUseCases.getDuePaymentsUseCase.execute(companyId: companyId, date: date) { [weak self] resultState in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.duePaymentsState = resultState
            }
        }
    }
    
    func getBuildingDueInvoices(bu_id: String, date:String) {
        buildingDueInvoicesState = .loading
        
        rentalUseCases.getBuildingDueInvoicesUseCase.execute(buId: bu_id, date: date) { [weak self] resultState in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.buildingDueInvoicesState = resultState
            }
        }
    }
    
    func getBuildingDuePayments(bu_id: String, date:String) {
        buildingDuePaymentsState = .loading
        
        rentalUseCases.getBuildingDuePaymentsUseCase.execute(buId: bu_id, date: date) { [weak self] resultState in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.buildingDuePaymentsState = resultState
            }
        }
    }
    
    func getBuildingAvailableRooms(bu_id: String) {
        buildingAvailableRoomsState = .loading
        
        rentalUseCases.getBuildingAvailableRoomsUseCase.execute(buId: bu_id) { [weak self] resultState in
            guard let self = self else { return }
           
            DispatchQueue.main.async {
                self.buildingAvailableRoomsState = resultState
            }
        }

    }

    func getBuildingOccupiedRooms(bu_id: String) {
        buildingOccupiedRoomsState = .loading
        
        rentalUseCases.getBuildingOccupiedRoomsUseCase.execute(buId: bu_id) { [weak self] resultState in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.buildingOccupiedRoomsState = resultState
            }
        }
       
    }

}


