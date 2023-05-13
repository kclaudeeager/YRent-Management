//
//  MainScreen.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State private var buildings: [Building] = []
    @ObservedObject var viewModel: RentalViewModel
    @ObservedObject var userViewModel: UserViewModel
    @State private var networkErrorDialog: String? = nil
    @State var user:User
    @State private var company:Company? = nil
    let userId:String
    @State private var roomCount = 0
    @State private var availableRoomCount = 0
    @State private var occupiedRoomCount = 0
    @State private var invoiceCount = 0
    @State private var paymentsCount = 0
    
    @State private var showAlert=false
    @State private var confirmLogOut=false
    let screens = [
        Screen(route: "home", title: "Home", icon: "house"),
        Screen(route: "available_rooms", title: "Available", icon: "exclamationmark.triangle"),
        Screen(route: "occupied_rooms", title: "Occupied", icon: "heart"),
        Screen(route: "invoice", title: "Invoice", icon: "info.circle"),
        Screen(route: "payments", title: "Payments", icon: "hand.thumbsup")
    ]
    private let datePickerFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM"
           return formatter
       }()
    
    @State private var screenCounts:[Screen:Int] = [:]
    
    @State private var data: [String: Int] = [:]
   // data["invoices"] = invoiceCount
   
    let companyId:String
    
    @StateObject private var navController: NavController =  NavController(initialScreen:  Screen(route: "home", title: "Home", icon: "house"))
    
    
    var body: some View {
        ZStack {
          
            NavigationView {
                
                VStack {
                    Spacer()
                    VStack {
                        BoxView(cornerRadius: 5, padding: 8) {
                            ScreenContainerView(data: data, navController: navController, viewModel: viewModel, buildings: buildings,companyId: companyId)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top, 1)
                    BottomNavigationBar(screens: screens, givenScreenCounts: screenCounts, selectedItemIndex: $navController.currentScreenIndex, navController: navController, companyId: companyId, viewModel: viewModel)
                } .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Are you sure you want to logout?"),
                        primaryButton: .default(Text("Cancel")),
                        secondaryButton: .destructive(Text("Logout")) {
                            showAlert=false
                            confirmLogOut=true
                        }
                    )
                }

                .ignoresSafeArea()
                .navigationTitle("")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            navController.isLeftPanelOpen.toggle()
                        }, label: {
                            Image(systemName: "line.horizontal.3")
                        }
                               
                        )
                      
                        
                    }
                    ToolbarItem(placement: .navigation) {
                        Text(company?.cmp_full ?? "YYUSSA").bold().padding(.leading, 16)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showAlert=true
                        }, label: {
                            Image(systemName: "power")
                        })
                    }
                }
            }
            
            if  navController.isLeftPanelOpen{
                withAnimation(Animation.linear(duration: 0.6).repeatForever(autoreverses: false)) {
                    
                    TopNavigationDrawer(drawerState: $navController.isLeftPanelOpen, onLogout: {
                        showAlert=true
                    }, user: user, companyName: company?.cmp_full ?? "YYUSSA")
                    .offset(x: navController.isLeftPanelOpen ? 0 : -UIScreen.main.bounds.width / 2)
                    
                }
            }
            
        }
        .onChange(of: confirmLogOut){newValue in
            if newValue{
                userViewModel.logout(user: user)
            }
            
        }
        .onAppear {
            viewModel.getRooms(company_id: companyId)
            viewModel.$roomsState
                .sink{ roomsState in
                    switch roomsState{
                        
                    case .idle:
                        break
                    case .loading:
                        print("Loading rooms....")
                        break
                    case .success(let rooms):
                        self.roomCount = rooms.count
                    case .failure(let error):
                        print("Error",error.localizedDescription)
                    }
                    
                }.store(in: &viewModel.cancellables)
            viewModel.getOccupiedRooms(company_id: companyId)
            viewModel.$occupiedRoomsState
                .sink{ roomsState in
                    switch roomsState{
                        
                    case .idle:
                        break
                    case .loading:
                        print("Loading rooms....")
                        break
                    case .success(let rooms):
                        self.occupiedRoomCount = rooms.count
                    case .failure(let error):
                        print("Error",error.localizedDescription)
                    }
                    
                }.store(in: &viewModel.cancellables)
            
            viewModel.getAvailableRooms(company_id: companyId)
            
            viewModel.$availableRoomsState
                .sink { resultState in
                    switch resultState{
                        
                    case .idle:
                        break
                    case .loading:
                        print("Loading rooms....")
                        break
                    case .success(let rooms):
                        self.availableRoomCount = rooms.count
                    case .failure(let error):
                        print("Error",error.localizedDescription)
                    }
                    screenCounts=[ Screen(route: "available_rooms", title: "Available", icon: "exclamationmark.triangle"): availableRoomCount,
                                   Screen(route: "occupied_rooms", title: "Occupied", icon: "heart"): occupiedRoomCount,
                                   Screen(route: "invoice", title: "Invoice", icon: "info.circle"): invoiceCount,
                                   Screen(route: "payments", title: "Payments", icon: "hand.thumbsup"): paymentsCount
                    ]
                   
                }
                .store(in: &viewModel.cancellables)
            
            
            viewModel.getBuildings(company_id: companyId)
            viewModel.$buildingsState
                .sink { resultState in
                    if case let .success(resultBuildings) = resultState {
                        self.buildings = resultBuildings
                        data["buildings"] = resultBuildings.count
                    }
                    else if case let .failure(error) = resultState {
                        self.networkErrorDialog = error.localizedDescription
                    }
                }
                .store(in: &viewModel.cancellables)
            userViewModel.fetchCompany(companyId: companyId)
            userViewModel.$companyResult.sink{resultState in
                switch resultState{
                case .success(let company):
                    self.company=company
                case .idle:
                    break
                case .loading:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } .store(in: &userViewModel.cancellables)
            
            viewModel.getDueInvoices(companyId: companyId, date: datePickerFormatter.string(from: Date()) )
           
            
            viewModel.$dueInvoicesState
                .sink{resultState in
                
                       switch resultState{
                           
                       case .idle:
                           break
                       case .loading:
                           print("Loading rooms....")
                           break
                       case .success(let rooms):
                           self.invoiceCount = rooms.count
                       case .failure(let error):
                           print("Error",error.localizedDescription)
                       }
                }.store(in: &viewModel.cancellables)
            
            viewModel.getDuePayments(companyId: companyId, date: datePickerFormatter.string(from: Date()) )
            viewModel.$duePaymentsState
                .sink{resultState in
                
                       switch resultState{
                           
                       case .idle:
                           break
                       case .loading:
                           print("Loading rooms....")
                           break
                       case .success(let rooms):
                           self.paymentsCount = rooms.count
                       case .failure(let error):
                           print("Error",error.localizedDescription)
                       }
                }.store(in: &viewModel.cancellables)
            
            data["invoices"] = invoiceCount
            data["payments"] = paymentsCount
        }
        .onChange(of: roomCount){ newValue in
            data["total"] = newValue
        }
        .onChange(of: availableRoomCount){ newValue in
            data["available"] = newValue
            screenCounts=[ Screen(route: "available_rooms", title: "Available", icon: "exclamationmark.triangle"): newValue,
                           Screen(route: "occupied_rooms", title: "Occupied", icon: "heart"): occupiedRoomCount,
                           Screen(route: "invoice", title: "Invoice", icon: "info.circle"): invoiceCount,
                           Screen(route: "payments", title: "Payments", icon: "hand.thumbsup"): paymentsCount
            ]
        
        }
        .onChange(of: occupiedRoomCount){newValue in
            data["occupied"] = occupiedRoomCount
            
            screenCounts=[ Screen(route: "available_rooms", title: "Available", icon: "exclamationmark.triangle"): availableRoomCount,
                           Screen(route: "occupied_rooms", title: "Occupied", icon: "heart"): newValue,
                           Screen(route: "invoice", title: "Invoice", icon: "info.circle"): invoiceCount,
                           Screen(route: "payments", title: "Payments", icon: "hand.thumbsup"): paymentsCount
            ]
        }
        .onChange(of: buildings){ newValue in
            data["buildings"] = newValue.count
        }
        .onChange(of: invoiceCount){newValue in
            data["invoices"] = newValue
        }
        .onChange(of: paymentsCount){newValue in
            data["payments"] = newValue
        }
        .onChange(of: userViewModel.user){newValue in
            if newValue == nil{
                DispatchQueue.main.async {
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                        let mainWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
                            fatalError("Unable to retrieve main window")
                        
                    }
                  
                    let contentView =   ContentView()
                    let contentViewController = UIHostingController(rootView: contentView)
                    mainWindow.rootViewController = UINavigationController(rootViewController: contentViewController)
                }
            }
        }
        
     
    }
}




struct MainView_Previews: PreviewProvider {
    static var previews: some View {

        let dependencyContainer = DependencyContainer()
        let rentalViewModel = dependencyContainer.rentalViewModel
        let userViewModel = dependencyContainer.userViewModel
        

        MainView(viewModel: rentalViewModel,userViewModel: userViewModel,user: User(acc_id: "1", l_name: "KC", f_name: "", username: "", role_id: "1", co_id: "1", side: "3", mobile: "0789"),userId:"1", companyId: "1")
    }
}
