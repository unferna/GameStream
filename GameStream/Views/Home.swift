//
//  Home.swift
//  GameStream
//
//  Created by Fernando Florez on 18/08/21.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var selectedView: Int = 2
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(named: "tabBarColor")
        UITabBar.appearance().isTranslucent = true
    }
    
    var body: some View {
        TabView(selection: $selectedView) {
            Text("Perfil")
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            GamesView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            
            HomeScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(2)
            
            Text("Favoritos")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }
        .accentColor(.white)
    }
}

struct HomeScreen: View {
    @State var searchText: String = ""
    
    var isSearchingColor: Color {
        searchText.isEmpty ? Color(.yellow) : Color("darkCian")
    }

    var body: some View {
        ZStack {
            Color("mainFill")
                .ignoresSafeArea()
            
            VStack {
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom)
                
                ScrollView {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(isSearchingColor)
                        
                        ZStack(alignment: .leading) {
                            if searchText.isEmpty {
                                Text("Buscar un video")
                                    .foregroundColor(Color("lightGray"))
                            }
                            
                            TextField("", text: $searchText)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.all, 11)
                    .background(Color("blueGray"))
                    .clipShape(Capsule())
                    
                    SubmoduleHome()
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SubmoduleHome: View {
    @State var isPlayerActive = false

    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    let urlVideos: [String] = [
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"
    ]
    
    var body: some View {
        VStack {
            Text("Los más populares")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                Button(action: {
                    url = urlVideos[0]
                    print("URL:", url)
                    isPlayerActive = true
                }) {
                    VStack(spacing: 0) {
                        Image("The Witcher 3")
                            .resizable()
                            .scaledToFit()
                        
                        Text("The Witcher 3")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(8)
                            .background(Color("blueGray"))
                    }
                }
                
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .allowsHitTesting(false)
                    
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical)
            
            Text("Categorías sugeridas para tí")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack  {
                    Button(action: {}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blueGray"))
                                .frame(width: 160, height: 90)
                            
                            VStack {
                                Image("imgIconFPS")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                                Text("FPS")
                                    .bold()
                                    .foregroundColor(Color("cian"))
                            }
                        }
                    }
                    
                    Button(action: {}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blueGray"))
                                .frame(width: 160, height: 90)
                            
                            VStack {
                                Image("imgIconRPG")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                                Text("RPG")
                                    .bold()
                                    .foregroundColor(Color("cian"))
                            }
                        }
                    }
                    
                    Button(action: {}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blueGray"))
                                .frame(width: 160, height: 90)
                            
                            VStack {
                                Image("imgIconOpenWorld")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                                Text("Open World")
                                    .bold()
                                    .foregroundColor(Color("cian"))
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
            
            Text("Recomendados para tí")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack  {
                    Button(action: {
                        url = urlVideos[1]
                        print("URL:", url)
                        isPlayerActive = true
                    }) {
                        Image("Abzu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button(action: {
                        url = urlVideos[2]
                        print("URL:", url)
                        isPlayerActive = true
                    }) {
                        Image("Crash Bandicoot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button(action: {
                        url = urlVideos[3]
                        print("URL:", url)
                        isPlayerActive = true
                    }) {
                        Image("DEATH STRANDING")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                }
            }
            .padding(.bottom)
            
            Text("Videos que podrían gustarte")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack  {
                    Button(action: {
                        url = urlVideos[4]
                        print("URL:", url)
                        isPlayerActive = true
                    }) {
                        Image("Grand Theft Auto V")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button(action: {
                        url = urlVideos[5]
                        print("URL:", url)
                        isPlayerActive = true
                    }) {
                        Image("Hades")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                }
            }
            .padding(.bottom)
        }
        
        NavigationLink(
            destination: VideoPlayer(player: AVPlayer(url: URL(string: url)! )).frame(maxWidth: .infinity),
            isActive: $isPlayerActive,
            label: { EmptyView () }
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
