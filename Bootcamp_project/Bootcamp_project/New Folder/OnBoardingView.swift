//
//  OnBoardingView.swift
//  Bootcamp_project
//
//  Created by Rashid Ahamed on 23/10/25.
//

import SwiftUI

struct OnBoardingView: View {
    /*
     0 - welcome
     1 - add name
     2 - add age
     3 - add gender
     */
    @State private var onBoardingState: Int = 0
    let transition:AnyTransition = .asymmetric(insertion: .move(edge: .trailing)
                                               , removal: .move(edge: .leading))
    @State private var name : String = ""
    @State private var age : Double = 50
    @State private var gender : String = ""
    
    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    
    @AppStorage("name") var currentUserName:String?
    @AppStorage("age") var currentUserAge:Int?
    @AppStorage("gender") var currentUserGender:String?
    @AppStorage("sign_in") private var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack{
            // content
            ZStack{
                switch onBoardingState {
                case 0:
                    welcomeScreen
                        .transition(transition)
                case 1:
                    addNameScreen
                        .transition(transition)
                case 2:
                    addAgeScreen
                        .transition(transition)
                case 3:
                    genderScreen
                        .transition(transition)
                default:
                    Text("Welcome")
                }
            }
            // button
            VStack{
                Spacer()
                bottomButton
            }
             .padding(30)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle))
        }
    }
}

#Preview {
    OnBoardingView()
        .background(Color.purple)
}


//Components

extension OnBoardingView {
    private var bottomButton: some View {
        Text(onBoardingState == 0 ? "SIGN UP":
            onBoardingState == 3 ? "FINISH" : "NEXT"
        )
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    
    private var welcomeScreen: some View {
        VStack(spacing: 30){
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200,height: 200)
                .foregroundColor(.white)
            
            Text("Find your match!")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.semibold)
            Text("This is the app for finding your match Online! It is a very simple app that allows you to find your match online. It is a very simple app that allows you to find your match online.")
                .foregroundColor(.white)
                .fontWeight(.medium)
            Spacer()
            Spacer()
        }
        .padding(30)
        .multilineTextAlignment(.center)
    }
    
    private var addNameScreen: some View {
       
        VStack(spacing: 30){
            Spacer()
            Text("Add your name")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.semibold)
            TextField("Enter your name", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
            
            Spacer()
            Spacer()
                
        }
        .padding(30)
    }
    
    private var addAgeScreen: some View {
        VStack(spacing: 30){
            Spacer()
            Text("Add your age")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.semibold)
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                
            Slider(value: $age, in: 18...100, step: 1)
                .accentColor(.white)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var genderScreen: some View {
        VStack(spacing: 30){
            Spacer()
                
                Text("Choose your gender")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Picker("Select a gender", selection: $gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Non-Binary").tag("Non-Binary")
                }
                .pickerStyle(MenuPickerStyle())
                .foregroundColor(.purple)
                .padding(.horizontal, 20)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10)
                
                Spacer()
            Spacer()
            }
        .padding(30)
        }
    }

extension OnBoardingView{
    func handleNextButtonPressed(){
        
        //check input
        switch onBoardingState {
        case 1 :
            guard name.count >= 3 else {
                showAlerts(title:"name must be 3 characters long!")
                return
            }
            break
            
        case 3 :
            guard gender.count > 1 else {
                showAlerts(title: "Please select a gender")
                return
            }
        default:
            break
        }
        
        
        // go next section
        if onBoardingState == 3 {
            // sign in
            signIn()
        }else{
            withAnimation(.easeInOut) {
                onBoardingState+=1
            }
            
        }
        
    }
    
    func signIn(){
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
                currentUserSignedIn = true
            }
        
    }
    
    func showAlerts(title:String){
        alertTitle = title
        showAlert.toggle()
    }
}
    



