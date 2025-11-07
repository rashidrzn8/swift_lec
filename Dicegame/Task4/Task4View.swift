//
//  Task4View.swift
//  Dicegame
//
//  Created by Rashid Ahamed on 3/11/25.
//

import SwiftUI

struct Task4View: View {
    @State private var names:[String] = ["Rashid", "Abu", "Jahid", "Mohsin", "Rashid"]
    @State var nameToAdd:String = ""
    @State var pickedName:String?
    @State private var shouldRemoveIt: Bool = false
    var body: some View {
        VStack{
            
            Text("Picked Name \(String(describing: pickedName ?? " "))")
            
            List{
                ForEach(names, id:\.self){name in
                    Text(name)
                }
            }
            TextField("name to add", text: $nameToAdd)
                .textFieldStyle(.roundedBorder)
                .padding()
                .background(Color.gray)
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            Divider()
            Toggle("Remove picked item", isOn: $shouldRemoveIt)

            Button{
                if let randomName = names.randomElement(){
                    pickedName = randomName
                    if shouldRemoveIt{
                        names.removeAll(){name in
                                return name == pickedName
                        }
                    }
                    
                    
                    
                }else{
                    pickedName = nil
                }
                
            }label: {
                Text("Pick a name")
                    .padding(.vertical, 8)
                    .padding(.horizontal,16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
    }
}
#Preview {
    Task4View()
}
