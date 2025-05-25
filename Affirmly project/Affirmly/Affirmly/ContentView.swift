//
//  ContentView.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isSignedIn = false

    var body: some View {
        Group {
            NavigationView {
                if isSignedIn {
                    MainTabView()
                } else {
                    WelcomeView(isSignedIn: $isSignedIn)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
