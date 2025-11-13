//
//  SettingsView.swift
//  FilmsApp
//
//  Created by Rashid Ahamed on 8/11/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("appearenceTheme")
    var appearingTheme: AppearingTheme = .system
    var body: some View {
        NavigationStack{
            Form{
                withAnimation(.easeIn) {
                    Picker("Appearence",selection: $appearingTheme){
                        ForEach(AppearingTheme.allCases){item in
                            Text(item.rawValue).tag(item)
                        }
                    }
                    .pickerStyle(.inline)
                }
            }
            .navigationTitle("Settings")
        }
    }
}


enum AppearingTheme:String, CaseIterable,Identifiable{
    case system = "system"
    case light = "light"
    case dark = "dark"
    
    var id:Self {return self}
}

#Preview {
    SettingsView()
}
