//
//  ProfileView.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    // Info
                    VStack(alignment: .leading, spacing: 8) {
                        InfoRow(title: "Name", value: user.name)
                        InfoRow(title: "Email", value: user.email)
                        InfoRow(title: "Member Since", value: "\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    }
                    .padding()
                    
                    // Sign out
                    Button(action: {
                        viewModel.logout()
                    }) {
                        Text("Log Out")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fatchUser()
        }
    }
}

struct InfoRow: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
            Text(value)
                .foregroundColor(.secondary)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
