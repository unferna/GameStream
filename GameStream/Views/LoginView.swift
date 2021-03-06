//
//  LoginView.swift
//  GameStream
//
//  Created by Fernando Florez on 16/08/21.
//

import SwiftUI

struct LoginView: View {
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""
    @State var isHomeActive: Bool = false
    @State var invalidCredentialsEntered: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                InputForm(textBinding: $emailTextField, label: "Correo Electronico", placeholder: "example@mail.com")
                
                InputForm(textBinding: $passwordTextField, label: "Contraseña", placeholder: "Escribe tu contraseña", isSecureTextField: true, bottomSpace: 0)
                
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Text("¿Olvidaste tu contraseña?")
                            .font(.footnote)
                            .foregroundColor(Color("darkCian"))
                            .padding(5)
                    
                    }.buttonStyle(PlainButtonStyle())
                }
                .padding(.bottom, 32)
                
                Button(action: login) {
                    VStack {
                        Text("Iniciar Sesión".uppercased())
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
                .alert(isPresented: $invalidCredentialsEntered) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Datos incorrectos"),
                        dismissButton: .default(Text("Entendido"))
                    )
                }
                
                VStack {
                    Text("Inicia sesión con redes sociales")
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
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.horizontal, 32)
            .onAppear() {
                if let data = LocalStorage.shared.getData() {
                    emailTextField = data.email
                    passwordTextField = data.password
                }
            }
            
            // Navigation
            NavigationLink(
                destination: Home(),
                isActive: $isHomeActive,
                label: { EmptyView() }
            )
        }
    }
    
    func login() {
        print("Did tap login")
        if LocalStorage.shared.login(email: emailTextField, password: passwordTextField) {
            isHomeActive = true
            invalidCredentialsEntered = false
        
        } else {
            isHomeActive = false
            invalidCredentialsEntered = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
