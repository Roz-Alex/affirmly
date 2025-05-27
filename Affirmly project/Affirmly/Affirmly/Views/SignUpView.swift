//
//  SignUpView.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @Binding var isSignedIn: Bool
    
    @State private var errorMessage: String?

    var body: some View {
        ZStack {
            // Фоновый цвет
            Color(red: 0.98, green: 0.98, blue: 0.95)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()

                Text("Sign up")
                    .font(Font.custom("Raleway", size: 32))
                    .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))

                VStack(spacing: 16) {
                    CustomInputField2(title: "Your Name", text: $name)
                    CustomInputField2(title: "Email", text: $email)
                    CustomInputField2(title: "Password", text: $password, isSecure: true)
                }
                .padding(.horizontal, 32)
                
                if let error = errorMessage {
                                    Text(error)
                                        .foregroundColor(.red)
                                        .font(.caption)
                                }

                Button(action: performSignUp) {
                    Text("Sign up")
                        .font(Font.custom("Raleway", size: 20))
                        .foregroundColor(Color(red: 1, green: 1, blue: 0.98))
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color(red: 0.35, green: 0.46, blue: 0.40).opacity(0.65))
                        .cornerRadius(15)
                }
                .padding(.horizontal, 32)
                .padding(.top, 16)
                
                HStack {
                    Text("Already have an account?")
                        .font(.custom("Raleway", size: 20))
                        .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))

                    NavigationLink(destination: SignInView(isSignedIn: $isSignedIn)) {
                        Text("Sign in")
                            .font(.custom("Raleway", size: 20))
    //                        .fontWeight(700)
                            .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))
                            .underline() // Опционально: добавляет подчёркивание для кликабельности
                    }
                }
                .foregroundColor(.primary) // Общий цвет текста, если нужно

                Spacer()
            }
        }
    }

private func performSignUp() {
        errorMessage = nil

        NetworkManager.shared.register(email: email, password: password, name: name) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let auth):
                    print("Зарегистрирован:", auth)
                    UserDefaults.standard.set(auth.accessToken, forKey: "access_token")
                    
                    self.isSignedIn = true

                case .failure(let error):
                    print("Ошибка регистрации: $error.localizedDescription)")
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}


// Общий вид текстового поля (можно переиспользовать)
struct CustomInputField2: View {
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
