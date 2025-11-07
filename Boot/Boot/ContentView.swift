//
//  ContentView.swift
//  Boot
//
//  Created by Rashid Ahamed on 24/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                NavigationLink("Hellow ", destination: myOtherView())
                Text("fwhbfweb")
                Text("fwhbfweb")
                Text("fwhbfweb")
            }
            .navigationBarItems(
                leading: Image(systemName:"person.fill"),
                trailing: NavigationLink(destination: myOtherView(), label: {
                    Image(systemName:"gear")
                })
                    )
            
            
//            .navigationBarHidden(true)
            
        }
    }
}

struct myOtherView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Rectangle()
            .frame(width: 300, height: 200)
            .navigationTitle("Back")
//            .navigationBarHidden(true)
        
        Button("Go Back"){
            presentationMode.wrappedValue.dismiss()
        }
        
    }
}

#Preview {
    ContentView()
}
