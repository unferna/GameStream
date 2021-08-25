//
//  ProfileView.swift
//  GameStream
//
//  Created by Fernando Florez on 24/08/21.
//

import SwiftUI

struct ProfileView: View {
    @State var username = "John Doe"
    
    var body: some View {
        ZStack {
            Color("mainFill").ignoresSafeArea()
            
            VStack {
                Text("Perfil")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                VStack {
                    Button(action: {}) {
                        ZStack {
                            Image("profilePlaceholder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 118, height: 118)
                                .clipShape(Circle())
                        }
                    }
                }
                .padding(.top, 64)
                .padding(.bottom, 32)
                
                Text("Ajustes")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
                
                ProfileSubmodule()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear() {}
    }
}

struct ProfileSubmodule: View {
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    
    let options: [String] = [
        "Cuenta",
        "Notificaciones",
        "Editar Perfil",
        "Califica esta aplicación"
    ]
    
    var body: some View {
        VStack(spacing: 2) {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    if option == options[2] {
                        isEditProfileViewActive = true
                    }
                }) {
                    HStack {
                        Text(option)
                            .foregroundColor(.white)
                            .bold()
                        
                        Spacer()
                        
                        if option == "Notificaciones" {
                            Toggle("", isOn: $isToggleOn)
                            
                        } else {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 1))
                    .padding()
                }
                .buttonStyle(PlainButtonStyle())
                .frame(minHeight: 70)
                .background(Color("blueGray"))
            }
        }
        
        NavigationLink(
            destination: EditProfileView(),
            isActive: $isEditProfileViewActive,
            label: { EmptyView() }
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
