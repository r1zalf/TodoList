//
//  AddView.swift
//  TodoList
//
//  Created by Rizal Fahrudin on 17/01/24.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    @State var valueTextField = ""
    @State var showAlert = false
    @State var messageAlert = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Type somthing here..", text: $valueTextField)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 13))
            
            Button("Save", action: saveButton)
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 13))
            
            Spacer()
        }
        .padding()
        .navigationTitle("Add an item ✏️")
        .alert("Something wrong!!!", isPresented: $showAlert) {
            Button("ok", role: .cancel) {}
        } message: {
            Text(messageAlert)
        }
        
    }
    
    func saveButton() {
        if isValid() {
            listViewModel.add(item: ItemModel(title: valueTextField))
            dismiss()
        }
    }
    
    func isValid() -> Bool {
        if valueTextField.count < 3 {
            showAlert.toggle()
            messageAlert = "Text must be at least 3 character okeyy 🤓🤓🤓"
            return false
        }
        return true
    }
}

#Preview {
    AddView()
}
