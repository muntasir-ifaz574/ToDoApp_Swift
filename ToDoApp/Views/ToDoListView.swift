//
//  ToDoListView.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var item: [ToDoListItem]
    
//    private let userId: String
    
    init(userId: String){
//        self.userId = userId
        self._item = FirestoreQuery(
        collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(item) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
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
        ToDoListView(userId: "gEXLlOrxZ4aIzDk3OgWfU8lPwoD3")
    }
}
