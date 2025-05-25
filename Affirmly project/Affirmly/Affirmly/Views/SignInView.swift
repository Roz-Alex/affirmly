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
    @Binding var isSignedIn: Bool
    
    @State private var errorMessage: String? = nil

    var body: some View {
        VStack(spacing: 20) {
            CustomInputField(title: "Email", text: $email)
            CustomInputField(title: "Password", text: $password, isSecure: true)
            
            if let error = errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .font(.caption)
                        }
            
            Button("Sign In") {
                print("Sign in tapped")
                performLogin()
//                isSignedIn = true
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.88, green: 0.69, blue: 0.39))
            .foregroundColor(.white)
            .cornerRadius(10)
            
            HStack {
                Text("Don’t have an account?")
                    .font(.custom("Raleway", size: 20))
                    .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))

                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .font(.custom("Raleway", size: 20))
//                        .fontWeight(700)
                        .foregroundColor(Color(red: 0.31, green: 0.41, blue: 0.35))
                        .underline() // Опционально: добавляет подчёркивание для кликабельности
                }
            }
            .foregroundColor(.primary) // Общий цвет текста, если нужно
            
        }
        .padding()
    }
    
    // MARK: - Логика входа
    
    private func performLogin() {
            errorMessage = nil
            
            NetworkManager.shared.login(email: email, password: password) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let auth):
                        print("Вошли! Токен: $auth.accessToken)")
                        // Сохраняем токен (например, в UserDefaults)
                        UserDefaults.standard.set(auth.accessToken, forKey: "access_token")
                        // Переходим в приложение
                        self.isSignedIn = true
                        
                    case .failure(let error):
                        print("Ошибка входа: $error)")
                        print(error)
                        errorMessage = "Неверный email или пароль"
                    }
                }
            }
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
