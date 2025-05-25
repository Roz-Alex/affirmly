//
//  AddAffirmationView.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import SwiftUI

struct AddAffirmationView: View {
    var body: some View {
        ZStack {
            // Фоновый цвет
            Color(red: 0.98, green: 0.98, blue: 0.95)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                
                // Картинка в верхнем правом углу
                Image("categoriesSnail")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                    .position(x: UIScreen.main.bounds.width - 100, y: 100) // Позиционируем в правый верхний угол
                
                Text("Categories")
                    .font(Font.custom("Raleway", size: 32))
                    .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))
                    .padding(.top, 50)

                // Поиск
                RoundedRectWithBorder()
                    .frame(height: 41)
                    .overlay(
                        ZStack {
                            // Placeholder для иконки или текста
                        }
                    )

                // Карточки категорий
                CategoryCard(title: "Calm")
                CategoryCard(title: "Health")
                CategoryCard(title: "Happiness")
                CategoryCard(title: "Future")

                Spacer()

                // Кнопка создания
                Button(action: {
                    // Действие
                }) {
                    Text("Create new affirmation")
                        .font(Font.custom("Raleway", size: 25))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.33, green: 0.46, blue: 0.38))
                        .cornerRadius(15)
                }
                .padding(.horizontal)

                // Нижняя навигация
                HStack(spacing: 30) {
                    ForEach(0..<4) { _ in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 36, height: 36)
                    }
                }
                .frame(height: 46)
                .padding(.bottom, 20)
            }
        }
        .frame(width: 393, height: 852)
    }
}

struct RoundedRectWithBorder: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color(red: 0.98, green: 0.98, blue: 0.95))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(red: 0.75, green: 0.72, blue: 0.66), lineWidth: 0.5)
            )
            .frame(width: 329)
    }
}

struct CategoryCard: View {
    let title: String

    var body: some View {
        RoundedRectWithBorder()
            .frame(height: 89)
            .overlay(
                HStack {
                    Text(title)
                        .font(Font.custom("Raleway", size: 25))
                        .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))
                        .padding(.leading)
                    Spacer()
                }
            )
    }
}
