//
//  NewItemView.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Text("New Thing To Do")
                        .font(.system(size: geometry.size.width * 0.1))
                        .bold()
                        .padding(.top, geometry.size.height * 0.05)
                    
                    Form {
                        Section(header: Text("Details")) {
                            TextField("Title", text: $viewModel.title)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        Section(header: Text("Due Date and Time")) {
                            DatePicker(selection: $viewModel.dueDate, displayedComponents: [.date, .hourAndMinute]) {
                                Text("Select Date and Time")
                            }
                            .datePickerStyle(GraphicalDatePickerStyle())
                        }
                    }
                    .padding(.horizontal, geometry.size.width * 0.05)
                    
                    Button(action: {
                        if viewModel.canSave {
                            viewModel.save()
                            newItemPresented = false
                        } else {
                            viewModel.showAlert = true
                        }
                    }) {
                        Text("Save")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, geometry.size.width * 0.1)
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(
                            title: Text("Error"),
                            message: Text("Please fill all fields and select a due date equal to today or later.")
                        )
                    }
                    
                    Spacer()
                }
                .navigationBarTitle("", displayMode: .inline)
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(
            newItemPresented: Binding(
                get: { return true },
                set: { _ in }
            )
        )
    }
}

