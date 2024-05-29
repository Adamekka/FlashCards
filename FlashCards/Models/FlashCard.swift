//
//  FlashCard.swift
//
//  Copyright © 2024 Adam Cvikl
//

import Foundation

struct FlashCard: Codable, Identifiable {
    var id: UUID = .init()
    var name: String
    var dateCreated: Date = .init()

    init(name: String) {
        self.name = name
    }
}
