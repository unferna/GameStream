//
//  FavoritesView.swift
//  GameStream
//
//  Created by Fernando Florez on 24/08/21.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    @ObservedObject var gameViewModel = GamesViewModel()
    
    var body: some View {
        ZStack {
            Color("mainFill")
                .ignoresSafeArea()
            
            VStack {
                Text("Favoritos")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
                
                ScrollView {
                    ForEach(gameViewModel.gamesInfo, id: \.self) { game in
                        VStack(alignment: .leading, spacing: 0) {
                            VideoPlayer(player: AVPlayer(url: URL(string: game.videosUrls.mobile )! ))
                                .frame(height: 300)
                            
                            Text(game.title)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color("blueGray"))
                                .clipShape(RoundedRectangle(cornerRadius: 3))
                        }
                    }
                }
            }
            .padding(16)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
