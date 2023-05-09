//
//  LoginView.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/9/23.
//

import Foundation
import SwiftUI
import ToastUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    @State private var isShowingProgress = false
    
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
                      

                    
                    SecureField("Password", text: $viewModel.password)
                        .padding(15)
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
            case .idle, .success, .failure:
                isShowingProgress = false
            case .loading:
                isShowingProgress = true
            }
        }

    }
}
