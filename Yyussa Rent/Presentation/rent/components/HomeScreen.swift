//
//  HomeScreen.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation
import SwiftUI
import Shimmer
struct HomeScreen: View {
    @State  var data: [String: Int]
    let navController: NavController
    let companyId : String
    @ObservedObject var viewModel: RentalViewModel
    @State var buildings:[Building]
    @State private var isLoading = false
    @State private var networkErrorDialog: String? = nil
    let homeCards:[CardInfoView]=[]
    
    var body: some View {
        ZStack {
         
            if isLoading {
                
                buildCardGridView(data: data, buildings: buildings, navController: navController, companyId: companyId, viewModel: viewModel).shimmer()
            }
            else{
                VStack {
                    if let error = networkErrorDialog {
                        InfoDialog(
                            title: "Whoops!",
                            desc: error,
                            onRetry: {
                                
                            },
                            onCancel: {
                                
                            }
                        )
                    }
                    
                    buildCardGridView(data: data, buildings: buildings, navController: navController, companyId: companyId, viewModel: viewModel)
                    
                }
            }
        }
        .onAppear(){
            isLoading = true
            viewModel.$dashboardState
                .sink{ newValue in
                    switch newValue {
                    case .success(roomsState: let roomsState, buildingsState: let buildingsState, duePaymentsState: let paymentState, dueInvoicesState: let invoiceState, availableRoomsState: let availableRoomsState, occupiedRoomsState: let occupiedRoomsState):
                        
                        if case .success(let rooms) = roomsState,
                           case .success(let buildings) = buildingsState,
                           case .success(let availableRooms) = availableRoomsState,
                           case .success(let occupiedRooms) = occupiedRoomsState ,
                           case .success(let payments) = paymentState,
                           case .success(let invoices) = invoiceState
                        {
                            
                            self.buildings=buildings
                            let buildingsTotal=buildings.count
                            let totalCount = rooms.count
                            let availableCount = availableRooms.count
                            let occupiedCount = occupiedRooms.count
                            let invoiceCount = invoices.count
                            let paymentCount = payments.count
                            self.data =  [
                                "buildings":buildingsTotal,
                                "total":totalCount,
                                "available":availableCount,
                                "occupied":occupiedCount,
                                "invoices":invoiceCount,
                                "payments":paymentCount
                            ]
                            
                            
                        }
                        isLoading = false
                    case .idle:
                        isLoading = false
                    case .loading:
                        isLoading = true
                    case .failure(let error):
                        self.networkErrorDialog = error.localizedDescription
                    }
                }.store(in: &viewModel.cancellables)
        }
        .onChange(of: viewModel.dashboardState){ newState in
            
            switch newState {
            case .success(roomsState: let roomsState, buildingsState: let buildingsState, duePaymentsState: let paymentState, dueInvoicesState: let invoiceState, availableRoomsState: let availableRoomsState, occupiedRoomsState: let occupiedRoomsState):
                
                if case .success(let rooms) = roomsState,
                   case .success(let buildings) = buildingsState,
                   case .success(let availableRooms) = availableRoomsState,
                   case .success(let occupiedRooms) = occupiedRoomsState ,
                   case .success(let payments) = paymentState,
                   case .success(let invoices) = invoiceState
                {
                    
                    self.buildings=buildings
                    let buildingsTotal=buildings.count
                    let totalCount = rooms.count
                    let availableCount = availableRooms.count
                    let occupiedCount = occupiedRooms.count
                    let invoiceCount = invoices.count
                    let paymentCount = payments.count
                    self.data =  [
                        "buildings":buildingsTotal,
                        "total":totalCount,
                        "available":availableCount,
                        "occupied":occupiedCount,
                        "invoices":invoiceCount,
                        "payments":paymentCount
                    ]
                    
                    
                }
                isLoading = false
            case .idle:
                isLoading = false
            case .loading:
                isLoading = true
            case .failure(let error):
                self.networkErrorDialog = error.localizedDescription
            }
        }
    }
}

func buildCardGridView(data: [String: Int]?, buildings: [Building], navController: NavController, companyId: String, viewModel: RentalViewModel) -> some View {
  LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 2) {
      if let buildingCount = data?["buildings"]{
          BoxView(){
              buildCardInfoView(itemCount:buildingCount,
                                itemName: "Buildings",
                                root: "buildings",
                                navController: navController,
                                icon: "building",
                                viewModel: viewModel,
                                isHome: true,
                                buildings:buildings, companyId: companyId)
          }
      }
      else {
          BoxView(){
              buildCardInfoView(itemCount:buildings.count,
                                itemName: "Buildings",
                                root: "buildings",
                                navController: navController,
                                icon: "building",
                                viewModel: viewModel,
                                isHome: true,
                                buildings:buildings, companyId: companyId)
          }
      }
      if  let totalCount = data?["total"]{
          BoxView(cornerRadius: 10, padding: 8){
              buildCardInfoView(itemCount: totalCount,
                                itemName: "Total",
                                root: Screen.home.route,
                                navController: navController,
                                icon: "building.fill",
                                viewModel: viewModel,
                                isHome: true,
                                buildings: buildings, companyId: companyId)
          }
      }
      if  let availableCount = data?["available"]{
          BoxView(cornerRadius: 10, padding: 8){
              buildCardInfoView(itemCount: availableCount,
                                itemName: "Available",
                                root: Screen.availableRooms.route,
                                navController: navController,
                                icon: "checkmark.circle.fill",
                                viewModel: viewModel,
                                isHome: true,
                                buildings: buildings, companyId: companyId)
          }
      }

      if let occupiedCount = data?["occupied"]{
          BoxView(cornerRadius: 10, padding: 8){
              buildCardInfoView(itemCount: occupiedCount,
                                itemName: "Occupied",
                                root: Screen.occupiedRooms.route,
                                navController: navController,
                                icon: "heart.circle.fill",
                                viewModel: viewModel,
                                isHome: true,
                                buildings: buildings, companyId: companyId)
          }

      }
      if let invoicesCount = data?["invoices"]{
          BoxView(cornerRadius: 10, padding: 8){
              buildCardInfoView(itemCount: invoicesCount,
                                itemName: "Invoices",
                                root: Screen.invoice.route,
                                navController: navController,
                                icon: "info.circle",
                                viewModel: viewModel,
                                isHome: true,
                                buildings: buildings, companyId: companyId)
          }

      }
      if let paymentsCount = data?["payments"]{
          BoxView(cornerRadius: 10, padding: 8){
              buildCardInfoView(itemCount: paymentsCount,
                                itemName: "Payments",
                                root: Screen.payments.route,
                                navController: navController,
                                icon: "hand.thumbsup",
                                viewModel: viewModel,
                                isHome: true,
                                buildings: buildings,companyId: companyId)
          }

      }
  }
}



struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        let navController = NavController(initialScreen:  Screen(route: "home", title: "Home"))
        let viewModel = DependencyContainer().rentalViewModel
        
        HomeScreen(data: [:], navController: navController, companyId: "1", viewModel: viewModel, buildings: [])
    }
}
