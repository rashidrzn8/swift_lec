//
//  ProfileView.swift
//  Bootcamp_project
//
//  Created by Rashid Ahamed on 23/10/25.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("name") var currentUserName:String?
    @AppStorage("age") var currentUserAge:Int?
    @AppStorage("gender") var currentUserGender:String?
    @AppStorage("sign_in") private var currentUserSignedIn: Bool = false
    
    var body: some View {
        VStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width:150,height: 150)
            Text(currentUserName ?? "your name here")
            Text("This user is \(currentUserAge ?? 0) years old")
            Text("There gender is \(currentUserGender ?? "unknown")")
            Text("SIGN OUT")
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(10)
                .padding(30)
                .onTapGesture {
                    signOut()
                }
        }
        .font(.title)
        .foregroundColor(.purple)
        .padding()
        .padding(.vertical,40)
        .cornerRadius(10)
        .shadow(radius: 10)
        
    }
    func signOut()
    {
        withAnimation(.spring()){
            currentUserAge=nil
            currentUserName=nil
            currentUserGender=nil
            currentUserSignedIn=false
        }
        
    }}

#Preview {
    ProfileView()
}
