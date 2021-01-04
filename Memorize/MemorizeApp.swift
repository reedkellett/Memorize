//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Reed Kellett on 11/10/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
