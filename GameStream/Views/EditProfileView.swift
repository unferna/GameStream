//
//  EditProfileView.swift
//  GameStream
//
//  Created by Fernando Florez on 24/08/21.
//

import SwiftUI

struct EditProfileView: View {
    @State var emailTextField = ""
    @State var passwordTextField = ""
    @State var nameTextField = ""
    
    @State var takenPicture: Image? = Image("profilePlaceholder")
    @State var isCameraViewActive: Bool = false
    
    var body: some View {
        ZStack {
            Color("mainFill").ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Text("Editar Perfil")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        isCameraViewActive = true
                    }) {
                        ZStack {
                            takenPicture?
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .sheet(isPresented: $isCameraViewActive) {
                                    SUImagePickerView(sourceType: .camera, image: $takenPicture, isPresented: $isCameraViewActive)
                                }
                            
                            Image(systemName: "camera")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                    }
                    
                    VStack {
                        InputForm(textBinding: $emailTextField, label: "Correo Electrónico", placeholder: "example@mailcom")
                        
                        InputForm(textBinding: $passwordTextField, label: "Contraseña", placeholder: "Introduce tu nueva contraseña", isSecureTextField: true)
                        
                        InputForm(textBinding: $nameTextField, label: "Nombre", placeholder: "Introduce tu nombre de usuario", bottomSpace: 32)
                        
                        Button(action: updateData) {
                            VStack {
                                Text("Actualizar Datos".uppercased())
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 11)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color("darkCian"), lineWidth: 1.0)
                                    .shadow(color: .white, radius: 6)
                            )
                        }
                        .padding(.bottom, 30)
                    }
                    .padding(16)
                    
                }
            }
        }
        .onAppear() {
            if let data = LocalStorage.shared.getData() {
                emailTextField = data.email
                passwordTextField = data.password
                nameTextField = data.name
            }
            
            if let picture = loadImage(named: "ProfilePhoto") {
                takenPicture = Image(uiImage: picture)
            
            } else {
                takenPicture = Image("profilePlaceholder")
            }
        }
    }
    
    private func updateData() {
        _ = LocalStorage.shared.saveData(email: emailTextField, password: passwordTextField, name: nameTextField)
    }
    
    func loadImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        
        return nil
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
