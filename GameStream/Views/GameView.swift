//
//  GameView.swift
//  GameStream
//
//  Created by Fernando Florez on 22/08/21.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    var game: Game!
    let galleryGrid = [GridItem(.flexible())]
    
    let commentsString: [String] = []
    
    var body: some View {
        ZStack {
            Color("mainFill").ignoresSafeArea()
            
            VStack {
                videoPlayer.frame(height: 300)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        gameInfo
                        
                        gallery
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
    
    var videoPlayer: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: game.videosUrls.mobile)! ))
            .edgesIgnoringSafeArea(.top)
    }
    
    var gameInfo: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(game.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            HStack {
                Text(game.studio)
                    .font(.subheadline)
                    .foregroundColor(.white)
                
                Text(game.contentRaiting)
                    .font(.subheadline)
                    .foregroundColor(.white)
                
                Text(game.publicationYear)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            Text(game.description)
                .foregroundColor(.white)
                .font(.subheadline)
                .padding()
            
            HStack {
                ForEach(game.tags, id: \.self) { tag in
                    Text("#\( tag )")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.top, 4)
                        .padding(.leading)
                }
            }
        }
    }
    
    var gallery: some View {
        VStack(alignment: .leading) {
            Text("Galeria")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: galleryGrid, spacing: 8) {
                    ForEach(game.galleryImages, id: \.self) { imageString in
                        KFImage(URL(string: imageString))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleGame = Game(
            title: "Sonic The Hedgedog",
            studio: "Sega",
            contentRaiting: "E+",
            publicationYear: "1991",
            description: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente",
            platforms: [],
            tags: ["Plataformas", "Mascota"],
            videosUrls: VideoUrl(mobile: "Ejemplo.com", tablet: ""),
            galleryImages: []
        )
        
        GameView(game: exampleGame)
    }
}
