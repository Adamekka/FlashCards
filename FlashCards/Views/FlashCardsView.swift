//
//  FlashCardsView.swift
//
//  Copyright © 2024 Adam Cvikl
//

import SwiftUI

struct FlashCardsView: View {
    @State private var flashCards: FlashCards = .init()

    @State private var newFlashCardPresented: Bool = false

    @State private var randomFlashCard: String = ""

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(self.flashCards.flashCards) { flashCard in
                        Text(flashCard.name)
                            .swipeActions(allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    self.flashCards.remove(id: flashCard.id)
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                    }
                }

                Section {
                    Button("Get random") {
                        self.randomFlashCard = self.flashCards.getRandom()
                    }

                    Text(self.randomFlashCard)
                }
            }
            .navigationTitle("Flash cards")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.newFlashCardPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }

            .sheet(isPresented: self.$newFlashCardPresented) {
                NewFlashCard()
            }
        }
        .environment(self.flashCards)
    }
}

#Preview {
    FlashCardsView()
}
