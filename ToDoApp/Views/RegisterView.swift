//  RegisterView.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            HeaderView(
                title: "Register",
                subtitle: "For Never Forget!",
                angel: -10,
                background: Color(hex: 0xFF7887C2).opacity(0.5)
            )
            // Login Form
            VStack(spacing: 20) {
                TextField("Enter Your Full Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Enter Your Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Enter Your Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                
                ButtonView(
                title: "Create Account", action: {
                    viewModel.register()
                }
                )
            }
            .padding(.horizontal, 30)
            .padding(.top, 30)
            Spacer()
        }
        .padding(.horizontal, 20)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}


