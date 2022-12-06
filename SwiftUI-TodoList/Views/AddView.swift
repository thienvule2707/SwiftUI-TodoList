//
//  AddView.swift
//  SwiftUI-TodoList
//
//  Created by Le Thien Vu on 11/11/2022.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) private var dismiss
    @State var textFieldText: String = ""
    let myColor = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    
    @State var alerTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(myColor)
                    .cornerRadius(10)
                
                Button(action: actionSaveButton) {
                        Text("Save".uppercased())
                            .foregroundColor(Color.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                }
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func actionSaveButton() {
        if isTextValidate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func isTextValidate() -> Bool {
        if (textFieldText.count < 3) {
            alerTitle = "Your new Todo must be at lease 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        Alert(title: Text(alerTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
