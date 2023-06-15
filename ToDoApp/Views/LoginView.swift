//
//  LoginView.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            HeaderView(
                title: "To Do",
                subtitle: "Never Forget",
                angel: 10,
                background: Color(hex: 0xFFC6EAE9)
            )
            // Login Form
            VStack(spacing: 20) {
                TextField("Enter Your Email Address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                
                SecureField("Enter Your Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                
//                Button(action: {
//                    // Action for button
//                }) {
//                    Text("Log In")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .frame(height: 50)
//                        .background(Color(hex: 0xFF1294F2))
//                        .cornerRadius(10)
//                }
                ButtonView(
                title: "Log In", action: {}
                )
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
