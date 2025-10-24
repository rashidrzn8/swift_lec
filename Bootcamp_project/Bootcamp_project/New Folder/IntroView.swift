//
//  IntroView.swift
//  Bootcamp_project
//
//  Created by Rashid Ahamed on 23/10/25.
//

import SwiftUI

struct IntroView: View {
    @AppStorage("sign_in") private var currentUserSignedIn: Bool = false
    var body: some View {
        ZStack{
            
        //background
          RadialGradient(
            gradient: Gradient(colors: [.blue, .purple]),
            center: .topLeading,
            startRadius: 5, endRadius: UIScreen.main.bounds.height)
          .edgesIgnoringSafeArea(.all)

            
            // if user is sign in
            // profile view
            //else
            //on boarding view
            
            if currentUserSignedIn {
                 // this sghoud show the profileView()
                ProfileView()
            }
            else{
                // this should show the onBording() view
                OnBoardingView()
            }
        }
    }
}

#Preview {
    IntroView()
}
