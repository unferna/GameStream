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
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }
        .accentColor(.white)
    }
}

struct HomeScreen: View {
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
    @State var searchText: String = ""
    
    @ObservedObject var homeViewModel = HomeViewModel()
    @State var foundGame: Game!
    

    @State var isGameViewActive = false
    @State var isGameInfoEmpty = false
    
    var isSearchingColor: Color {
        searchText.isEmpty ? Color(.yellow) : Color("darkCian")
    }
    
    let recommendedForYou: [String] = [
        "Abzu",
        "Crash Bandicoot",
        "DEATH STRANDING"
    ]
    
    let videosYouWouldLikeParams: [String] = [
        "Grand Theft Auto V",
        "Hades"
    ]
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(isSearchingColor)
                
                ZStack(alignment: .leading) {
                    if searchText.isEmpty {
                        Text("Buscar un video")
                            .foregroundColor(Color("lightGray"))
                    }
                    
                    TextField("", text: $searchText, onCommit:  {
                        searchGame(text: searchText)
                    })
                    .foregroundColor(.white)
                    .alert(isPresented: $isGameInfoEmpty) {
                        Alert(
                            title: Text("Error"),
                            message: Text("No se encontró el juego"),
                            dismissButton: .default(Text("Entendido"))
                        )
                    }
                }
            }
            .padding(.all, 11)
            .background(Color("blueGray"))
            .clipShape(Capsule())
            
            Text("Los más populares")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                Button(action: {
                    searchGame(text: "The Witcher 3")
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
                    ForEach(recommendedForYou, id: \.self) { gameName in
                        Button(action: {
                            searchGame(text: gameName)
                        }) {
                            Image(gameName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                        }
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
                    ForEach(videosYouWouldLikeParams, id: \.self) { gameName in
                        Button(action: {
                            searchGame(text: gameName)
                        }) {
                            Image(gameName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        
        NavigationLink(
            destination: GameView(game: foundGame),
            isActive: $isGameViewActive,
            label: { EmptyView () }
        )
    }
    
    func searchGame(text: String) {
        print("Search game:", text)
        self.homeViewModel.search(query: text)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            if homeViewModel.gamesInfo.count == 0 {
                isGameInfoEmpty = true
            
            } else if let game = homeViewModel.gamesInfo.first {
                foundGame = game
                isGameViewActive = true
                isGameInfoEmpty = false
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
