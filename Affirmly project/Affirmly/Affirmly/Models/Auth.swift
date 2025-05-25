//
//  Auth.swift
//  Affirmly
//
//  Created by Алексей Розанов on 25.05.2025.
//

import Foundation

struct LoginRequest: Codable {
    let email: String
    let password: String
}

struct AuthResponse: Codable {
    let accessToken: String
    let tokenType: String
    let user: UserResponse
}

struct UserResponse: Codable {
    let id: String
    let name: String
    let email: String
}
