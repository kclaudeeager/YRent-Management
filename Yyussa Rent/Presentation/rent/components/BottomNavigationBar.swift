//
//  BottomNavigationBar.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation
import SwiftUI

struct BottomNavigationBar: View {
    let screens: [Screen]
    let givenScreenCounts: [Screen: Int]
    @Binding var selectedItemIndex: Int
    let navController: NavController
    @State private var paymentCount=0
    @State private var invoiceCount=0
    @State private var gradient=Gradient(colors: [Color.loginBackground1, Color.loginBackground2])
    let companyId:String
    let viewModel:RentalViewModel
    private let datePickerFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM"
           return formatter
       }()
    var body: some View {
       
            VStack {
               
                HStack(spacing: 0) { // Use spacing 0 to fill the available width
                    ForEach(screens.indices, id: \.self) { index in
                        let screen = screens[index]
                        Button(action: {
                            selectedItemIndex = index
                            navController.navigate(to: screen.route)
                            
                        }) {
                            VStack {
                                if let icon = screen.icon {
                                    Image(systemName: icon)
                                        .font(.system(size: 20))
                                        .foregroundColor(selectedItemIndex == index ? .accentColor : .secondary)
                                }
                                Text(screen.title)
                                    .font(.caption)
                                    .foregroundColor(selectedItemIndex == index ? .accentColor : .secondary)
                                
                                if let count = givenScreenCounts[screen] {
                                    
                                    if screen == Screen.invoice || screen == Screen.payments {
                                        let itemCount = screen == Screen.invoice ? invoiceCount : paymentCount
                                        if itemCount > 0 {
                                            Text("\(itemCount)")
                                                .font(.caption2)
                                                .foregroundColor(.white)
                                                .padding(4)
                                                .background(Color.red)
                                                .clipShape(Circle())
                                                .offset(x: 15, y: -10)
                                        } else {
                                            Text("\(count)")
                                                .font(.caption2)
                                                .foregroundColor(.white)
                                                .padding(4)
                                                .background(Color.red)
                                                .clipShape(Circle())
                                                .offset(x: 15, y: -10)
                                        }
                                    } else {
                                        Text("\(count)")
                                            .font(.caption2)
                                            .foregroundColor(.white)
                                            .padding(4)
                                            .background(Color.red)
                                            .clipShape(Circle())
                                            .offset(x: 15, y: -10)
                                    }
                                }

                              
                            }
                        }
                        .frame(maxWidth: .infinity) // Set maxWidth to infinity to fill
                        
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    Color(UIColor.systemBackground)
                  
                )
                .clipShape(RoundedRectangle(cornerRadius: 20)
                
                )
              
                .shadow(radius: 10)
            }
            .padding(.bottom, (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.safeAreaInsets.bottom ?? 0)
            .ignoresSafeArea()
        
          
            .onChange(of: DateSelectionService.shared.invoiceSelectedDate){newValue in
                viewModel.getDueInvoices(companyId: companyId, date: datePickerFormatter.string(from: Date()) )
               
                
                viewModel.$dueInvoicesState
                    .sink{resultState in
                    
                           switch resultState{
                               
                           case .idle:
                               break
                           case .loading:
                               break
                           case .success(let invoices):
                             
                           invoiceCount = invoices.count
                               
                           case .failure(let error):
                               print("Error",error.localizedDescription)
                           }
                    }.store(in: &viewModel.cancellables)
                
              
                
            }
            .onChange(of: DateSelectionService.shared.paymentSelectedDate){newValue in
                viewModel.getDuePayments(companyId: companyId, date: datePickerFormatter.string(from: Date()) )
                viewModel.$duePaymentsState
                    .sink{resultState in
                    
                           switch resultState{
                               
                           case .idle:
                               break
                           case .loading:
                               break
                           case .success(let payments):
                               
                               paymentCount = payments.count
                           case .failure(let error):
                               print("Error",error.localizedDescription)
                           }
                    }.store(in: &viewModel.cancellables)
            }

        }
       
    
}


struct BottomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        let screens = [
              Screen(route: "home", title: "Home", icon: "house"),
              Screen(route: "available_rooms", title: "Available", icon: "exclamationmark.triangle"),
              Screen(route: "occupied_rooms", title: "Occupied", icon: "heart"),
              Screen(route: "invoice", title: "Invoice", icon: "info.circle"),
              Screen(route: "payments", title: "Payments", icon: "hand.thumbsup")
          ]
          
     
        let selectedItemIndex = Binding.constant(0)
        let navController = NavController(initialScreen: Screen(route: "home", title: "Home", icon: "house"))
        BottomNavigationBar(screens: screens, givenScreenCounts: [:], selectedItemIndex: selectedItemIndex, navController: navController, companyId: "1", viewModel: DependencyContainer().rentalViewModel)
    }
}


