//
//  DashboardView.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import SwiftUI

struct DashboardView: View {
    @State private var dailyAffirmation = Affirmation(
        id: UUID(),
        text: "Я уверена в себе и своих силах.",
        imageURL: nil,
        audioURL: nil,
        category: "Самооценка",
        tags: ["мотивация", "саморазвитие"],
        createdAt: Date()
    )

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Сегодняшняя аффирмация")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(dailyAffirmation.text)
                    .font(.title3)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    // позже — загрузка новой аффирмации
                }) {
                    Text("Добавить новую")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Affirmly 💫")
        }
    }
}
