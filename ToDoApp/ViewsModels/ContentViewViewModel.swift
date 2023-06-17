//
//  ContentViewViewModel.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.
//

import Foundation
import FirebaseAuth

class ContentViewViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{
            [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
