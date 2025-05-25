//
//  WelcomeView.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    @Binding var isSignedIn: Bool // Объявление binding для передачи состояния

    var body: some View {
        ZStack {
            Color("Background") // Из assets
                .ignoresSafeArea()

            VStack(spacing: 40) {
                Spacer()

                Text("Welcome to Affirmly")
                    .font(.custom("Raleway", size: 32))
                    .foregroundColor(Color("Text"))
                    .multilineTextAlignment(.center)
                
                Image("welcomeButterfly")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
                    .cornerRadius(10)

                Text("Daily dose of positive thinking")
                    .font(.custom("Raleway", size: 24))
                    .foregroundColor(Color("Text"))
                    .multilineTextAlignment(.center)

                Spacer()

                NavigationLink(destination: SignInView(isSignedIn: $isSignedIn)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("ButtonGetStarted"))
                            .frame(width: 329, height: 89)
                        
                        Text("Get started")
                            .font(.custom("Raleway", size: 24))
                            .foregroundColor(Color("TextOnTheButton"))
                    }
                }

                Spacer()
            }
            .padding()
        }
    }
}
