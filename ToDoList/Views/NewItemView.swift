//
//  NewItemView.swift
//  ToDoList
//
//  Created by Bhaskara Padala on 6/8/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New item")
                .font(.system(size: 24, weight: .bold))
                .textFieldStyle(DefaultTextFieldStyle())
                .fontWeight(.bold)
                .padding()
            
            Form{
                TextField("Title", text: $viewModel.title)
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButton(title: "Add", action: { if viewModel.canSave {viewModel.save()} else {viewModel.showAlert = true}
                    ; newItemPresented = false}, backgroundColor: .blue).fontWeight(.bold).padding(.horizontal)
            }.alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"), message: Text("Please fill all the fields"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {return true}, set: {_ in }))
}
