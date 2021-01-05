//
//  EmojiMemoryGame.swift
//  Memorize
//  ViewModel
//
//  Created by Reed Kellett on 11/12/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    private var themes: [Theme]
    private(set) var currentTheme: Theme
    
    init() {
        // MARK: - Theme Constants
        themes = Array<Theme>()
        themes.append(Theme(name: "halloween", emojis: ["👻","🎃","🕷"], numPairsOfCards: 3, color: Color.orange))
        themes.append(Theme(name: "farm animals", emojis: ["🐮","🐷","🐤"], numPairsOfCards: 3, color: Color.red))
        themes.append(Theme(name: "flags", emojis: ["🇺🇸","🇬🇧","🏴󠁧󠁢󠁥󠁮󠁧󠁿","🇸🇪","🇿🇦","🇧🇷"], numPairsOfCards: nil, color: Color.blue))
        currentTheme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: currentTheme)
    }
        
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme.numPairsOfCards ?? Int.random(in: 2...theme.emojis.count)) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
    
    func newMemoryGame() {
        currentTheme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: currentTheme)
    }
        
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}

struct Theme {
    let name: String
    let emojis: [String]
    let numPairsOfCards: Int?
    let color: Color
}
