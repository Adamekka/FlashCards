//
//  UserDefaults.swift
//
//  Copyright © 2024 Adam Cvikl
//

import Foundation

// MARK: - DefaultKeys

enum DefaultKeys {
    static let flashCardsKey: String = "FLASH_CARDS_KEY"
}

extension UserDefaults {
    func save(key: String, obj: some Codable) {
        do {
            let data: Data = try JSONEncoder().encode(obj)
            self.set(data, forKey: key)
            print("Saved: \(obj.self) to UserDefaults")
        } catch {
            print("Error saving: \(obj.self) to UserDefaults")
            print(error)
        }
    }

    func load<T: Codable>(key: String, obj: T.Type) -> T? {
        do {
            guard let data = self.object(forKey: key) as? Data else {
                return nil
            }
            let loadedData: T = try JSONDecoder().decode(T.self, from: data)
            print("Loaded: \(obj) from UserDefaults")
            return loadedData
        } catch {
            print("Error loading: \(obj.self) fom UserDefaults")
            print(error)
            return nil
        }
    }
}
