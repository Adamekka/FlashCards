//
//  FlashCards.swift
//
//  Copyright © 2024 Adam Cvikl
//

import Foundation

@Observable
final class FlashCards: Codable {
    var flashCards: [FlashCard]

    init() {
        self.flashCards = UserDefaults.standard.load(
            key: DefaultKeys.flashCardsKey,
            obj: FlashCards.self
        )?.flashCards ?? []
    }

    func saveToUserDefaults() {
        UserDefaults.standard.save(key: DefaultKeys.flashCardsKey, obj: self)
    }

    func add(name: String) {
        let flashCard: FlashCard = .init(name: name)
        self.flashCards.append(flashCard)
        self.saveToUserDefaults()
    }

    func getRandom() -> String {
        self.flashCards.shuffled().first?.name ?? "Flash cards are empty"
    }

    func remove(id: UUID) {
        self.flashCards.removeAll { $0.id == id }
        self.saveToUserDefaults()
    }

    enum CodingKeys: CodingKey {
        case flashCards
    }

    // swiftlint:disable explicit_type_interface
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.flashCards = try container.decode(Array.self, forKey: .flashCards)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.flashCards, forKey: .flashCards)
    }
    // swiftlint:enable explicit_type_interface
}
