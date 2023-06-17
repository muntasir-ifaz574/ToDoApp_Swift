//
//  ToDoListView.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
