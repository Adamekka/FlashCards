//
//  NewFlashCard.swift
//
//  Copyright © 2024 Adam Cvikl
//

import SwiftUI

struct NewFlashCard: View {
    @Environment(\.dismiss) var dismiss: DismissAction

    @Environment(FlashCards.self) private var flashCards: FlashCards

    @State private var name: String = ""

    var body: some View {
        NavigationStack {
            List {
                TextField("Flash card name", text: self.$name)

                Button("Save") {
                    self.flashCards.add(name: self.name)
                    self.dismiss()
                }
            }
            .navigationTitle("Create new flash card")
        }
    }
}

#Preview {
    NewFlashCard()
        .environment(FlashCards())
}
