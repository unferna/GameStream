//
//  GamesView.swift
//  GameStream
//
//  Created by Fernando Florez on 22/08/21.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    @ObservedObject var gamesViewModel = GamesViewModel()
    @State var gameViewIsActive: Bool = false
    @State var selectedGame: Game!
    
    let grid = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ZStack {
            Color("mainFill").ignoresSafeArea()
            
            VStack {
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView {
                    LazyVGrid(columns: grid, spacing: 8) {
                        ForEach(gamesViewModel.gamesInfo, id: \.self) { game in
                            Button(action: {
                                selectedGame = game
                                gameViewIsActive = true
                                
                            }) {
                                KFImage( URL(string: game.galleryImages.first! ))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 4))
                                    .padding(.bottom, 12)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            
            NavigationLink(
                destination: GameView(game: selectedGame),
                isActive: $gameViewIsActive,
                label: { EmptyView() }
            )
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
