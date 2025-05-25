//
//  EducationalView.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import SwiftUI

struct ResourceCard: View {
    var title: String
    var description: String
    var link: String

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(Font.custom("Raleway", size: 25))
                .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))

            Text(description)
                .font(Font.custom("Raleway", size: 20))
                .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))

            Text(link)
                .font(Font.custom("Raleway", size: 20).weight(.bold))
                .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))
        }
        .padding()
        .frame(width: 329, height: 263, alignment: .topLeading)
        .background(Color(red: 0.98, green: 0.98, blue: 0.95))
        .cornerRadius(15)
        .overlay(
           RoundedRectangle(cornerRadius: 15)
                .stroke(Color(red: 0.75, green: 0.72, blue: 0.66), lineWidth: 0.5)
       )
    }
}

struct EducationalView: View {
    var body: some View {
        ZStack {
            Color(red: 0.98, green: 0.98, blue: 0.95)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 40) {
                // Картинка
                Image("educational")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                    .position(x: UIScreen.main.bounds.width - 100, y: 100) // Позиционируем в правый верхний угол
                Text("Educational")
                    .font(Font.custom("Raleway", size: 32))
                    .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))
                    .padding(.top, 40)

                ResourceCard(
                    title: "Title 1",
                    description: "description",
                    link: "link →"
                )

                ResourceCard(
                    title: "Title 2",
                    description: "description",
                    link: "link →"
                )

                Spacer()

                HStack(spacing: 32) {
                    Circle().fill(Color.gray).frame(width: 39, height: 39) // замени на иконку
                    Circle().fill(Color.gray).frame(width: 37, height: 36)
                    Circle().fill(Color.gray).frame(width: 37, height: 37)
                    Circle().fill(Color.gray).frame(width: 45, height: 42)
                }
                .padding(.bottom, 30)
            }
        }
        .frame(width: 393, height: 852)
    }
}
