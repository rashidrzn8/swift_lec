//
//  ContentView.swift
//  Furniture-swift
//
//  Created by Rashid Ahamed on 24/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab : Tab = .Home
    init() {
        UITabBar.appearance().isHidden = true
    }
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $currentTab, content: {
            Text("Home")
            Text("Search View")
            Text("Notification")
            Text("Cart")
            Text("Profile")
        })
        .overlay(
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.rawValue){
                    tab in TabButton(tab:tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                .background(Color("kSecondary"))
            }
        )
        
    }
}

#Preview {
    ContentView()
}

enum Tab : String,CaseIterable {
    case Home = "house"
    case Search = "magnifyingglass"
    case Notification = "bell"
    case Cart = "bag"
    case Profile = "person.crop.circle"
    
    var Tapname : String {
        switch self {
        case .Home :
            return "Home"
        case .Search :
            return "Search"
            case .Notification :
            return "Notification"
        case .Cart :
            return "Cart"
        case .Profile :
            return "Profile"
        
        }
    }
}

extension View{
   func getSafeArea() -> UIEdgeInsets{
       guard let screen = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
           return .zero
       }
       guard let safeArea = screen.windows.first?.safeAreaInsets else {
           return .zero
       }
       return safeArea
    }
    
//    func updateUiView(_ uiView: UIViewType, context: Context){
//
//    }
}
