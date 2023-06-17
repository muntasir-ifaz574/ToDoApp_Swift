//
//  LoginViewViewModel.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login(){
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    
    //Login Form Validation
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please Fill All Fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please Enter Valid Email"
            return false
        }
        return true
    }
}
