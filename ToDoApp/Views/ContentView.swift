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
                TabView {
                    ToDoListView(userId: viewModel.currentUserId)
                        .tabItem{
                            Label("Home", systemImage: "house")
                        }
                    ProfileView()
                        .tabItem{
                            Label("Profile", systemImage: "person.circle")
                        }
                }
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
