//
//  AffirmationCardView.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import SwiftUI

struct AffirmationCard: View {
    var text: String
    var tag: String
    var color: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 0.98, green: 0.98, blue: 0.95))
                .frame(width: 329, height: 392)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(red: 0.75, green: 0.72, blue: 0.66), lineWidth: 0.5)
                )

            VStack(spacing: 20) {
                Rectangle()
                    .fill(color)
                    .frame(width: 280, height: 160)
                    .cornerRadius(10)

                Text(text)
                    .font(Font.custom("Raleway", size: 25))
                    .foregroundColor(Color("MainText"))
                    .multilineTextAlignment(.center)

                Text(tag)
                    .font(Font.custom("Raleway", size: 15).bold())
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(red: 0.95, green: 0.93, blue: 0.89))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(red: 0.75, green: 0.72, blue: 0.66), lineWidth: 0.5)
                            )
                    )
            }
        }
    }
}
