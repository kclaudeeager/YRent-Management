//
//  LoginView.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/9/23.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    @State private var isShowingProgress = false
    @State private var showPassword = false
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.loginBackground1, Color.loginBackground2]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                VStack(spacing: 20) {
                    TextField("Username", text: $viewModel.username)
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.loginBackground1)
                      

                    HStack {
                            if showPassword {
                                        TextField("Password", text: $viewModel.password)
                                                   
                                            } else {
                                                SecureField("Password", text: $viewModel.password)
                                                   
                                            }
                                            Button(action: {
                                                showPassword.toggle()
                                            }) {
                                                Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                                    .foregroundColor(.gray)
                                            }
                                        }.padding(15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.loginBackground2)
                  
                }
                
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Log in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.loginBackground1, Color.loginBackground2]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(15.0)
                }
                .disabled(isShowingProgress)
                .overlay(
                    isShowingProgress ?
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                        : nil
                )
                
                if case LoginState.failure(let error) = viewModel.state {
                   
                    if !viewModel.isFormValid {
                        Text("Fill up the required fields please!")
                            .foregroundColor(.red)
                            .font(.headline)
                            .padding()
                    } else{
                        Text(error.localizedDescription)
                            .foregroundColor(.red)
                            .font(.headline)
                            .padding()
                    }
                }
               
                
                Spacer()
            }
            .padding()
        }
        .disabled(isShowingProgress)
        .onAppear {

        }.onChange(of: viewModel.state) { state in
            switch state {
            case .idle, .failure:
                isShowingProgress = false
            case .loading:
                isShowingProgress = true
            case .success(let user):
                DispatchQueue.main.async {
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                        let mainWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
                            fatalError("Unable to retrieve main window")
                        
                    }
                    let dependencyContainer = DependencyContainer()
                    let rentalViewModel = dependencyContainer.rentalViewModel
                    let userViewModel = dependencyContainer.userViewModel
                    
                    let mainView = MainView(viewModel: rentalViewModel, userViewModel:userViewModel, user: user ,userId:user.acc_id, companyId: user.co_id)
                    let homePageViewController = UIHostingController(rootView: mainView)
                    mainWindow.rootViewController = UINavigationController(rootViewController: homePageViewController)
                }
                isShowingProgress = false
                break
                
            }
      
        }

    }
}
