//
//  SignInView.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            CustomInputField(title: "Email", text: $email)
            CustomInputField(title: "Password", text: $password, isSecure: true)
            Button("Sign In") {
                print("Sign in tapped")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.88, green: 0.69, blue: 0.39))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct CustomInputField1: View {
    var title: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(Font.custom("Raleway", size: 20))
                .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))

            if isSecure {
                SecureField("", text: $text)
                    .padding()
                    .background(Color(red: 0.95, green: 0.93, blue: 0.89))
                    .cornerRadius(30)
            } else {
                TextField("", text: $text)
                    .padding()
                    .background(Color(red: 0.95, green: 0.93, blue: 0.89))
                    .cornerRadius(30)
            }
        }
    }
}
