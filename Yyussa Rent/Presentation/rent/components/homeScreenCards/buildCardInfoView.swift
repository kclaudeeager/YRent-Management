//
//  buildCardInfoView.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation

import SwiftUI

struct buildCardInfoView: View {
    @State var itemCount: Int
    let itemName: String
    let root: String
    let navController: NavController
    let icon: String
    let viewModel: RentalViewModel
    let isHome: Bool
    let buildings: [Building]
    let companyId:String
    @State private var isLoading=false
    @State private var choosenDate = Date()
    @State private var isShowingDatePicker = false
    @State private var selectedDate:Date = Date()
    @State private var networkErrorDialog: String? = nil
    private let datePickerFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM"
           return formatter
       }()
    
    @State var selectedBuilding:Building = Building(id: "0", name: "All", address: "")
    var body: some View {
        ZStack{
           
            VStack(spacing: 0) {
               
                if !isHome {
                    BuildingsList(
                        buildings: buildings,
                        onBuildingSelected: { building in
                            self.selectedBuilding=building
                            
                            getItemCount(for: root, selectedBuildingId: building.id, viewModel: viewModel, companyId: companyId, selectedDate: selectedDate){ itemCount in
                                self.itemCount = itemCount
                            }
                            
                        },
                        selectedBuilding: selectedBuilding
                    )
                    Spacer().frame(height: 10)
                    if itemName == "Invoices" || itemName == "Payments"{
                        YearMonthDatePicker(selectedDate: $selectedDate){ newDate in
                            self.choosenDate=newDate
                            getItemCount(for: root, selectedBuildingId: selectedBuilding.id, viewModel: viewModel, companyId: companyId, selectedDate: newDate){ itemCount in
                                self.itemCount = itemCount
                            }
                            if  itemName == "Invoices"{
                                DateSelectionService.shared.invoiceSelectedDate = selectedDate
                            }
                            else{
                                DateSelectionService.shared.paymentSelectedDate = selectedDate
                            }

                        }
                    }
                }
                if isLoading{
                    ProgressView()
                } else{
                    CardInfoView(
                        itemCount: itemCount,
                        itemName: itemName,
                        root: root,
                        navController: navController,
                        icon: {
                            Image(systemName: icon)
                        }()
                    )
                }
              
            }.onAppear(){
                if root == Screen.invoice.route{
                    if let invoiceSelectedDate = DateSelectionService.shared.invoiceSelectedDate{
                        self.selectedDate = invoiceSelectedDate
                    }
                    else{
                        self.selectedDate = choosenDate
                    }
                }
                if root == Screen.payments.route{
                    if let paymentSelectedDate = DateSelectionService.shared.paymentSelectedDate{
                        self.selectedDate = paymentSelectedDate
                    }
                    else{
                        self.selectedDate = choosenDate
                    }
                
                }
            }
            .onChange(of: choosenDate){ newValue in
                self.selectedDate = newValue
                getItemCount(for: root, selectedBuildingId: selectedBuilding.id, viewModel: viewModel, companyId: companyId, selectedDate: newValue){ itemCount in
                    self.itemCount = itemCount
                }
            }
            if let error = networkErrorDialog {
                InfoDialog(
                    title: "Whoops!",
                    desc: error,
                    onRetry: {
                        networkErrorDialog = nil
                    },
                    onCancel: {
                        networkErrorDialog = nil
                    }
                )
            }
          
          
        }
      
    }
    func getItemCount(for root: String, selectedBuildingId: String, viewModel: RentalViewModel, companyId: String, selectedDate: Date, completion: @escaping (Int) -> Void) {
        
        switch root {
        case Screen.availableRooms.route:
            if selectedBuildingId != "0" {
                viewModel.getBuildingAvailableRooms(bu_id: selectedBuildingId)
                viewModel.$buildingAvailableRoomsState
                    .sink { resultState in
                        switch resultState {
                        case .idle:
                            self.isLoading=false
                            break
                        case .loading:
                            self.isLoading=true
                            break
                        case .success(let rooms):
                            completion(rooms.count)
                            self.isLoading=false
                        case .failure(let error):
                            self.isLoading=false
                            self.networkErrorDialog=error.localizedDescription
                           
                        }
                    }
                    .store(in: &viewModel.cancellables)
            } else {
                viewModel.getAvailableRooms(company_id: companyId)
                viewModel.$availableRoomsState
                    .sink { resultState in
                        switch resultState {
                        case .idle:
                            self.isLoading=false
                            break
                        case .loading:
                            self.isLoading=true
                            break
                        case .success(let rooms):
                            completion(rooms.count)
                            self.isLoading=false
                        case .failure(let error):
                            self.isLoading=false
                            self.networkErrorDialog=error.localizedDescription
                          
                        }
                    }
                    .store(in: &viewModel.cancellables)
            }
        case Screen.occupiedRooms.route:
            if selectedBuildingId != "0" {
                viewModel.getBuildingOccupiedRooms(bu_id: selectedBuildingId)
                viewModel.$buildingOccupiedRoomsState
                    .sink { resultState in
                        switch resultState {
                        case .idle:
                            self.isLoading=false
                            break
                        case .loading:
                            self.isLoading=true
                            break
                        case .success(let rooms):
                            completion(rooms.count)
                            self.isLoading=false
                        case .failure(let error):
                            self.isLoading=false
                            self.networkErrorDialog=error.localizedDescription
                           
                        }
                    }
                    .store(in: &viewModel.cancellables)
            } else {
                viewModel.getOccupiedRooms(company_id: companyId)
                viewModel.$occupiedRoomsState
                    .sink { resultState in
                        switch resultState {
                        case .idle:
                            self.isLoading=false
                            break
                        case .loading:
                            self.isLoading=true
                            break
                        case .success(let rooms):
                            completion(rooms.count)
                            self.isLoading=false
                        case .failure(let error):
                            self.isLoading=false
                            self.networkErrorDialog=error.localizedDescription
                           
                        }
                    }
                    .store(in: &viewModel.cancellables)
            }
        case Screen.invoice.route:
            if selectedBuilding.id != "0" {
                viewModel.getBuildingDueInvoices(bu_id: "\(selectedBuilding.id)", date: datePickerFormatter.string(from: selectedDate))
                
                viewModel.$buildingDueInvoicesState
                    .sink { resultState in
                        switch resultState{
                            
                        case .idle:
                            self.isLoading=false
                            break
                        case .loading:
                            self.isLoading=true
                            break
                        case .success(let invoices):
                            completion(invoices.count)
                            self.isLoading=false
                        case .failure(let error):
                            self.isLoading=false
                            self.networkErrorDialog=error.localizedDescription
                           
                        }
                        
                    }
                    .store(in: &viewModel.cancellables)
            }
            else{
                viewModel.getDueInvoices(companyId: companyId, date: datePickerFormatter.string(from: selectedDate))
                
                viewModel.$dueInvoicesState
                    .sink { resultState in
                        switch resultState{
                            
                        case .idle:
                            self.isLoading=false
                            break
                        case .loading:
                            self.isLoading=true
                            break
                        case .success(let invoices):
                            completion(invoices.count)
                            self.isLoading=false
                        case .failure(let error):
                            self.isLoading=false
                            self.networkErrorDialog=error.localizedDescription
                           
                        }
                        
                    }
                    .store(in: &viewModel.cancellables)
            }
        case Screen.payments.route:
            if selectedBuilding.id != "0" {
                viewModel.getBuildingDuePayments(bu_id: "\(selectedBuilding.id)", date: datePickerFormatter.string(from: selectedDate))
                
                viewModel.$buildingDuePaymentsState
                    .sink { resultState in
                        switch resultState{
                            
                        case .idle:
                            self.isLoading=false
                            break
                        case .loading:
                            self.isLoading=true
                            break
                        case .success(let payments):
                           completion(payments.count)
                            self.isLoading=false
                        case .failure(let error):
                            self.isLoading=false
                            self.networkErrorDialog=error.localizedDescription
                           
                        }
                      
                    }
                    .store(in: &viewModel.cancellables)
            }
            else{
                viewModel.getDuePayments(companyId: companyId, date: datePickerFormatter.string(from: selectedDate))
                
                viewModel.$duePaymentsState
                    .sink { resultState in
                        switch resultState{
                            
                        case .idle:
                            self.isLoading=false
                            break
                        case .loading:
                            self.isLoading=true
                            break
                        case .success(let payments):
                            completion(payments.count)
                            self.isLoading=false
                        case .failure(let error):
                            self.isLoading=false
                            self.networkErrorDialog=error.localizedDescription
                           
                        }
                       
                    }
                    .store(in: &viewModel.cancellables)
            }
            break
        default:
            break
        }
    }
}




  

