//
//  ProfileView.swift
//  GameStream
//
//  Created by Fernando Florez on 24/08/21.
//

import SwiftUI

struct ProfileView: View {
    @State var username = "John Doe"
    @State var profileImage: UIImage = UIImage(named: "profilePlaceholder")!
    
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
                            Image(uiImage: profileImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                                .clipShape(Circle())
                        }
                    }
                    
                    Text(username)
                        .font(.callout)
                        .foregroundColor(.white)
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
        .onAppear() {
            if let data = LocalStorage.shared.getData() {
                username = data.name
            }
            
            if let picture = loadImage(named: "ProfilePhoto") {
                profileImage = picture
            
            } else {
                profileImage = UIImage(named: "profilePlaceholder")!
            }
        }
        .onDisappear() {
            
        }
    }
    
    func loadImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        
        return nil
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
