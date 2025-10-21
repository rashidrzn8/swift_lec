//
//  AddView.swift
//  To-Do
//
//  Created by Rashid Ahamed on 21/10/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var itemText:String = ""
    @EnvironmentObject private var listViewModel:ListViewModel
    @State private var alertTitle:String = ""
    @State private var showAlert:Bool = false
    var body: some View {
        ScrollView{
            VStack{
                TextField("Add an item" ,text: $itemText )
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button("Save".uppercased()){
                    saveButtonClicked()
                    
                }
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(10)
                
                .font(.headline)
            }.padding(15)
            
        }
        .navigationTitle("Add an Item..")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonClicked(){
        if textIsValid(){
            listViewModel.addItem(title: itemText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsValid() -> Bool {
        if itemText.count < 3 {
            
            alertTitle = "Item must be at least 3 characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }.environmentObject(ListViewModel())
   
}
