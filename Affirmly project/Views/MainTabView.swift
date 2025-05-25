//
//  MainTabView.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import SwiftUICore
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            EducationalView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Educational")
                }

            AddAffirmationView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Add")
                }

            FavouritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favourites")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
        .accentColor(Color(red: 0.31, green: 0.41, blue: 0.35))
    }
}
