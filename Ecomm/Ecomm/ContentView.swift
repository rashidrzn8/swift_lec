//
//  ContentView.swift
//  Ecomm
//
//  Created by Rashid Ahamed on 30/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @State private var currentTab: Tab = .Home
    @State private var showSidebar: Bool = false

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            // Main Tab Content
            TabView(selection: $currentTab) {
                Text("🏠 Home View")
                    .tag(Tab.Home)
                Text("🔍 Search View")
                    .tag(Tab.Search)
                Text("🔔 Notifications View")
                    .tag(Tab.Notifications)
                Text("🛍️ Cart View")
                    .tag(Tab.Cart)
                Text("👤 Profile View")
                    .tag(Tab.Profile)
            }
            
            // Custom Bottom Bar
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    TabButton(tab: tab, currentTab: $currentTab)
                }
            }
            .padding(.vertical, 12)
            .background(MaterialEffect(style: .systemUltraThinMaterial))
            .cornerRadius(20)
            .padding(.horizontal)
            .shadow(radius: 4)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

// MARK: - Tab Button View
struct TabButton: View {
    let tab: Tab
    @Binding var currentTab: Tab

    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                currentTab = tab
            }
        } label: {
            VStack(spacing: 6) {
                Image(systemName: tab.rawValue)
                    .font(.system(size: 22))
                    .foregroundColor(currentTab == tab ? .blue : .gray)
                
                Text(tab.Tabname)
                    .font(.caption2)
                    .foregroundColor(currentTab == tab ? .blue : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

// MARK: - Enum
enum Tab: String, CaseIterable {
    case Home = "house"
    case Search = "magnifyingglass"
    case Notifications = "bell"
    case Cart = "bag"
    case Profile = "person"
    
    var Tabname: String {
        switch self {
        case .Home: return "Home"
        case .Search: return "Search"
        case .Notifications: return "Notifications"
        case .Cart: return "Cart"
        case .Profile: return "Profile"
        }
    }
}

// MARK: - Blur Effect
struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

// MARK: - Safe Area Helper
extension View {
   func getSafeArea() -> UIEdgeInsets {
       guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene,
             let safeArea = screen.windows.first?.safeAreaInsets else { return .zero }
       return safeArea
    }
}

#Preview {
    ContentView()
        .environmentObject(CartManager())
}
