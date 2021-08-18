//
//  CreateAccountView.swift
//  GameStream
//
//  Created by Fernando Florez on 16/08/21.
//

import SwiftUI

struct CreateAccountView: View {
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""
    @State var passwordConfirmTextField: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Elige una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o elegirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(Color("lightGray"))
                    .padding(.bottom)
                
                Button(action: {}) {
                    ZStack {
                        Image("profilePlaceholder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Image(systemName: "camera")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                }
            }
            
            VStack(alignment: .leading) {
                InputForm(textBinding: $emailTextField, label: "Correo Electronico", placeholder: "example@mailcom")
                
                InputForm(textBinding: $passwordTextField, label: "Contraseña", placeholder: "Escribe tu contraseña", isSecureTextField: true)
                
                InputForm(textBinding: $passwordConfirmTextField, label: "Confirmar Contraseña", placeholder: "Vuelve a escribir tu contraseña", isSecureTextField: true, bottomSpace: 32)
                
                Button(action: {}) {
                    VStack {
                        Text("Regístrate".uppercased())
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
                
                VStack {
                    Text("Regístrate con redes sociales")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.bottom, 8)
                    
                    HStack {
                        Button("Facebook", action: {})
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40)
                            .background(Color("blueGray"))
                            .cornerRadius(8)
                        
                        Button("Twitter", action: {})
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40)
                            .background(Color("blueGray"))
                            .cornerRadius(8)
                    }
                }
            }
            .padding(.horizontal, 32)
        }
    }
}

struct InputForm: View {
    @Binding var textBinding: String
    
    var label: String
    var placeholder: String
    var isSecureTextField: Bool = false
    var bottomSpace: CGFloat?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(Color("darkCian"))
                .fontWeight(.bold)
            
            ZStack(alignment: .leading) {
                if textBinding.isEmpty {
                    Text(placeholder)
                        .font(.caption)
                        .foregroundColor(Color("lightGray"))
                }
                
                if isSecureTextField {
                    SecureField("", text: $textBinding)
                        .font(.body)
                        .foregroundColor(.white)
                
                } else {
                    TextField("", text: $textBinding)
                        .font(.body)
                        .foregroundColor(.white)
                }
            }
            
            if let bottomSpace = self.bottomSpace {
                Divider()
                    .frame(height: 1)
                    .background(Color("darkCian"))
                    .padding(.bottom, bottomSpace)
            
            } else {
                Divider()
                    .frame(height: 1)
                    .background(Color("darkCian"))
                    .padding(.bottom)
            }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
