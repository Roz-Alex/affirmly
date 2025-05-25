//
//  Affirmation.swift
//  Affirmly project
//
//  Created by krispi on 14/05/2025.
//

import Foundation

struct Affirmation: Identifiable, Codable {
    let id: UUID
    let text: String
    let imageURL: URL?
    let audioURL: URL?
    let category: String
    let tags: [String]
    let createdAt: Date
}
