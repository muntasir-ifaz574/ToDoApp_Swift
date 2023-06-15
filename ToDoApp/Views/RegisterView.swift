//  RegisterView.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
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
                TextField("Enter Your Full Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Enter Your Email Address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Enter Your Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                
                ButtonView(
                title: "Create Account", action: {}
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


