//
//  NetworkManager.swift
//  Affirmly
//
//  Created by Алексей Розанов on 25.05.2025.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - Авторизация
    
    func login(email: String, password: String, completion: @escaping (Result<AuthSignInResponse, Error>) -> Void) {
        let loginData = LoginRequest(email: email, password: password)
        
        guard let url = URL(string: "http://localhost:8000/affirmations/sign-in") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(loginData)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(AuthSignInResponse.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    // MARK: - Авторизация
    
    func register(email: String, password: String, name: String, completion: @escaping (Result<AuthRegisterResponse, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:8000/affirmations/register") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
            return
        }

        let body = ["email": email, "password": password, "name": name]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(AuthRegisterResponse.self, from: data)
                completion(.success(decoded))
            } catch {
                print("Ошибка парсинга: $error)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
