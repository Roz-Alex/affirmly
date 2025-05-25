//
//  CustomInputField.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import SwiftUI

struct CustomInputField: View {
    var title: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(Font.custom("Raleway", size: 20))
                .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))

            Group {
                if isSecure {
                    SecureField("", text: $text)
                } else {
                    TextField("", text: $text)
                }
            }
            .padding()
            .background(Color(red: 0.95, green: 0.93, blue: 0.89))
            .cornerRadius(30)
        }
    }
}
