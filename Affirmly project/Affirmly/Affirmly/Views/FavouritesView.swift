//
//  FavouritesView.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import SwiftUI

struct FavouritesView: View {
    var body: some View {
        ZStack {
            // Фон
            Color(red: 0.50, green: 0.23, blue: 0.27)
                .opacity(0.5)
                .frame(width: 368.34, height: 552.51)
                .offset(x: -47.33, y: -93.79)
            
            // Картинка
            Image("favouritesButterfly")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .cornerRadius(10)
                .position(x: UIScreen.main.bounds.width - 100, y: 100) // Позиционируем в правый верхний угол
            
            // Заголовок
            Text("Favourites")
                .font(Font.custom("Raleway", size: 32))
                .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))
                .offset(x: -88.50, y: -322)
            
            // Поисковая строка
            RoundedInputField()
                .frame(width: 329, height: 41)
                .offset(x: -3, y: -255.5)
                .overlay(
                    IconPlaceholder()
                        .offset(x: -141.5, y: -255.5)
                )

            // Карточки аффирмаций
            VStack(spacing: 30) {
                AffirmationCard(text: "I am calm and grounded.", tag: "Tag 3", color: Color("Background"))
                AffirmationCard(text: "I am calm and grounded.", tag: "Tag 1", color: Color("Background"))
                AffirmationCard(text: "I am calm and grounded.", tag: "Tag 4", color: Color("Background"))
            }
            .offset(y: -100)

            // Нижняя панель навигации
            BottomNavBar()
                .offset(y: 353)
        }
        .frame(width: 393, height: 852)
        .background(Color(red: 0.98, green: 0.98, blue: 0.95))
    }
}

// MARK: - Компоненты

struct RoundedInputField: View {
    var body: some View {
//        RoundedRectangle(cornerRadius: 15)
//            .fill(Color(red: 0.98, green: 0.98, blue: 0.95))
//            .overlay(
//                RoundedRectangle(cornerRadius: 15)
//                    .stroke(Color(red: 0.75, green: 0.72, blue: 0.66), lineWidth: 0.5)
//            )
    }
}

struct IconPlaceholder: View {
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(width: 24, height: 24)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(4)
    }
}

//struct AffirmationCard: View {
//    let text: String
//    let tags: [String]
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            RoundedInputField()
//                .frame(width: 329, height: 89)
//                .overlay(
//                    Text(text)
//                        .font(Font.custom("Raleway", size: 25))
//                        .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))
//                        .padding()
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                )
//            HStack(spacing: 10) {
//                ForEach(tags, id: \.self) { tag in
//                    TagView(tag: tag)
//                }
//            }
//        }
//    }
//}

struct TagView: View {
    let tag: String

    var body: some View {
        Text(tag)
            .font(Font.custom("Raleway", size: 15))
            .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(Color(red: 0.98, green: 0.98, blue: 0.95))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(red: 0.75, green: 0.72, blue: 0.66), lineWidth: 0.5)
            )
            .cornerRadius(15)
    }
}

struct BottomNavBar: View {
    var body: some View {
        HStack(spacing: 30) {
            NavIcon()
            NavIcon()
            NavIcon()
            NavIcon()
        }
        .frame(width: 336, height: 46)
    }
}

struct NavIcon: View {
    var body: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.2))
            .frame(width: 36, height: 36)
            .cornerRadius(8)
    }
}
