//
//  LoginView.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var isLoggingIn = false
    
    var body: some View {
        VStack {
            HeaderView(
                title: "To Do",
                subtitle: "Never Forget",
                angel: 10,
                background: Color(hex: 0xFFC6EAE9)
            )
            // Login Form
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(Color.red)
            }
            
            VStack(spacing: 20) {
                TextField("Enter Your Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
//                    .autocorrection()
                
                
                SecureField("Enter Your Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
//                    .autocorrection()
                
                Button(action: {
                    isLoggingIn = true
                    viewModel.login()
                }) {
                    if isLoggingIn {
                        ProgressView()
                            .padding(.horizontal)
                    } else {
                        Text("Log In")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding(.horizontal, 30)
            .padding(.top, 30)
            
            VStack {
                Text("If you are new!")
                NavigationLink("Create An Account", destination: RegisterView())
                    .foregroundColor(Color(hex: 0xFF102048))
                    .font(.headline)
            }
            .padding(.top, 80)
            .padding(.bottom, 10)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension Color {
    init(hex: UInt32) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
