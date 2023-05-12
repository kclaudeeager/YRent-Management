//
//  ScreenContainerView.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation
import SwiftUI

struct ScreenContainerView: View {

    @State private var screen: Screen?
    let data: [String: Int]
    @ObservedObject var navController: NavController
    let viewModel: RentalViewModel
    let buildings: [Building]
    let companyId:String
    private var currentScreen: Screen {
        navController.currentScreen ?? Screen(route: "", title: "", icon: "")
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            Group{
                
                if let screen = screen {
                    switch screen {
                    case .home:
                        HomeScreen(data: data, navController: navController, companyId: companyId, viewModel: viewModel, buildings: buildings)
                    case .availableRooms:
                        if let availableCount = data["available"] {
                            
                            buildCardInfoView(
                                itemCount: availableCount,
                                itemName: "Available",
                                root: Screen.availableRooms.route,
                                navController: navController,
                                icon: "checkmark.circle.fill",
                                viewModel: viewModel,
                                isHome: false,
                                buildings: buildings,
                                companyId: companyId
                            )
                            
                        }
                    case .occupiedRooms:
                        if let occupiedCount = data["occupied"] {
                            
                            buildCardInfoView(
                                itemCount: occupiedCount,
                                itemName: "Occupied",
                                root: Screen.occupiedRooms.route,
                                navController: navController,
                                icon: "heart.circle.fill",
                                viewModel: viewModel,
                                isHome: false,
                                buildings: buildings,
                                companyId: companyId
                            )
                        }
                    
                    case .invoice:
                        if let invoicesCount = data["invoices"]{
                            BoxView(cornerRadius: 10, padding: 8){
                                buildCardInfoView(itemCount: invoicesCount,
                                                  itemName: "Invoices",
                                                  root: Screen.invoice.route,
                                                  navController: navController,
                                                  icon: "info.circle",
                                                  viewModel: viewModel,
                                                  isHome: false,
                                                  buildings: buildings, companyId: companyId)
                            }
                            
                        }
                    case .payments:
                        if let paymentsCount = data["payments"]{
                            BoxView(cornerRadius: 10, padding: 8){
                                buildCardInfoView(itemCount: paymentsCount,
                                                  itemName: "Payments",
                                                  root: Screen.payments.route,
                                                  navController: navController,
                                                  icon: "hand.thumbsup",
                                                  viewModel: viewModel,
                                                  isHome: false,
                                                  buildings: buildings, companyId: companyId)
                            }
                            
                        }
                    
                    default:
                        HomeScreen(data: data, navController: navController, companyId: companyId, viewModel: viewModel, buildings: buildings)
                    }
                } else {
                    Color.clear
                }
            }
            .onAppear {
                screen = navController.currentScreen
            }
            .onChange(of: navController.currentScreen) { newScreen in
                if let screen = newScreen {
                    self.screen = screen
                    print("This is the current screen: \(screen)")
                }
            }
        }
    }
}

