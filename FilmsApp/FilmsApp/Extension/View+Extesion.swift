//
//  View+Extesion.swift
//  FilmsApp
//
//  Created by Rashid Ahamed on 8/11/25.
//

import SwiftUI

extension View{
    func setAppearenceTheme() -> some View{
        modifier(AppearingThemeModifier())
    }
}

struct AppearingThemeModifier:ViewModifier{
    @AppStorage("appearenceTheme")
    var appearingTheme: AppearingTheme = .system
    
    func body(content: Content) -> some View {
        content.preferredColorScheme(colorScheme())
    }
    
    func colorScheme() ->ColorScheme?{
        switch appearingTheme {
            case .system:
                return nil
            case .dark:
                return .dark
            case .light:
                return .light
        }
    }
}
