//
//  ContentView.swift
//  GameStream
//
//  Created by Fernando Florez on 14/08/21.
//

import SwiftUI

struct ContentView: View {
    @State var isSignInActive: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("mainFill")
                    .ignoresSafeArea()
                
                VStack {
                    Image("appLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom)
                        .offset(x: 0, y: 15)
                    
                    HStack(spacing: 50) {
                        Button(action: {
                            isSignInActive = true
                        }) {
                            Text("Inicia Sesión".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor( isSignInActive ? .white : .gray )
                                .padding()
                                
                        }
                        
                        Button(action: {
                            isSignInActive = false
                        }) {
                            Text("Regístrate".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor( !isSignInActive ? .white : .gray)
                                .padding()
                        }
                    }
                    
                    Spacer(minLength: 42)
                    
                    if isSignInActive {
                        LoginView()
                    
                    } else {
                        CreateAccountView()
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
    }
}
