//
//  EmojiMemoryGameView.swift
//  Memorize
//  View
//
//  Created by Reed Kellett on 11/10/20.
//

import SwiftUI



struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Button(action: {
                viewModel.newMemoryGame()
            }) {
                Text("New Game")
            }
            Text(viewModel.currentTheme.name)
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .padding(5)
            }
            //.aspectRatio(2/3, contentMode: .fit)
            .foregroundColor(viewModel.currentTheme.color)
            .padding()
            //.font(viewModel.cards.count > 5 ? Font.title : Font.largeTitle)
            Text("Score: "+String(viewModel.score))
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader{ geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true).padding(5).opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: - Drawing Constants
    
    private let fontScaleFactor: CGFloat = 0.7
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
