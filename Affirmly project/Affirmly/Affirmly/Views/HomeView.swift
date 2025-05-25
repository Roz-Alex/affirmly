//
//  HomeView.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Заголовок
            Text("Today’s\naffirmation")
                .font(Font.custom("Raleway", size: 32))
                .foregroundColor(Color("MainText"))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

            // Карточка аффирмации
            AffirmationCard(
                text: "I am calm and\ngrounded.",
                tag: "Calm",
                color: Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.5)
            )

            Spacer()

            // Навигация / Иконки снизу (пока как заглушка, можно потом заменить)
            HStack(spacing: 40) {
                Circle().frame(width: 36, height: 36).foregroundColor(.gray.opacity(0.3))
                Circle().frame(width: 36, height: 36).foregroundColor(.gray.opacity(0.3))
                Circle().frame(width: 36, height: 36).foregroundColor(.gray.opacity(0.3))
            }
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
    }
}
