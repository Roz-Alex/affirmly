//
//  ProfileView.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color(red: 0.98, green: 0.98, blue: 0.95) // фон
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Заголовок
                Text("Profile")
                    .font(.custom("Raleway", size: 32))
                    .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 32)
                    .padding(.top, 32)

                // Аватарка
                Circle()
                    .fill(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.5))
                    .frame(width: 155, height: 155)

                // Имя и почта
                VStack(spacing: 6) {
                    Text("Jane Doe")
                        .font(.custom("Raleway", size: 25))
                        .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))

                    Text("janedoe@gmail.com")
                        .font(.custom("Raleway", size: 20))
                        .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))
                }

                Spacer()

                // Блоки настроек
                VStack(spacing: 20) {
                    menuItem(text: "Personal progress")
                    menuItem(text: "My affirmations")
                    menuItem(text: "Settings")
                    menuItem(text: "Exit", isDestructive: true)
                }

                Spacer()

                // Нижняя навигация
                HStack(spacing: 30) {
                    Circle().frame(width: 45, height: 42)
                    Circle().frame(width: 37, height: 37)
                    Circle().frame(width: 37, height: 36)
                    Circle().frame(width: 39, height: 39)
                }
                .frame(height: 60)
                .padding(.bottom, 20)
            }
        }
        .frame(width: 393, height: 852)
    }

    @ViewBuilder
    func menuItem(text: String, isDestructive: Bool = false) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 0.98, green: 0.98, blue: 0.95))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(red: 0.75, green: 0.72, blue: 0.66), lineWidth: 0.5)
                )
                .frame(width: 329, height: 82)

            Text(text)
                .font(.custom("Raleway", size: 20))
                .foregroundColor(
                    isDestructive
                        ? Color(red: 0.90, green: 0.12, blue: 0.13)
                        : Color(red: 0.31, green: 0.41, blue: 0.35)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)
        }
    }
}
