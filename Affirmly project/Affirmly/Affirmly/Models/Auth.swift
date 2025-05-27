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

struct UserCreateRequest: Codable {
    let name: String
    let email: String
    let password: String
}

struct AuthSignInResponse: Codable {
    let accessToken: String
    let tokenType: String
    let user: UserResponse
}

struct AuthRegisterResponse: Codable {
    let accessToken: String
    let tokenType: String
    let user: UserResponse

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case user
    }
}

struct UserResponse: Codable {
    let id: String
    let name: String
    let email: String
}
