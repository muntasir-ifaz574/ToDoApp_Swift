//
//  ContentView.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                //Homse Screen
                ToDoListView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
