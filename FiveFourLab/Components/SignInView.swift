//
//  SignInView.swift
//  SwiftUIConcurrencyFinal
//
//  Created by Stephanie Diep on 2021-06-18.
//

import SwiftUI
import Firebase

struct SignInView: View {
    @EnvironmentObject var modalManager: ModalManager
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        ZStack() {
            VStack(spacing: 16.0) {
                Text("Sign in")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: 335, alignment: .leading)
                
                Text("Access to 120+ hours of courses, tutorials and livestreams")
                    .font(.subheadline)
                    .frame(maxWidth: 335, alignment: .leading)
                    .opacity(0.7)
                
                HStack {
                    GradientIcon()
                    TextField("Email address", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(UIKeyboardType.emailAddress)
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                }
                .padding(8)
                .frame(width: 335, height: 52, alignment: .leading)
                .background(.gray.opacity(0.1))
                .cornerRadius(20)
                
                HStack {
                    GradientIcon(icon: "key.fill")
                    SecureField("Password", text: $password)
                        .keyboardType(UIKeyboardType.namePhonePad)
                        .textContentType(.password)
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                }
                .padding(8)
                .frame(width: 335, height: 52, alignment: .leading)
                .background(.gray.opacity(0.1))
                .cornerRadius(20)
                
                GradientButton(text: "Sign in")
                    .onTapGesture {
                        login()
                    }
                
                Rectangle()
                    .frame(maxWidth: 335, maxHeight: 1)
                    .foregroundColor(.black).opacity(0.1)
                
                HStack(spacing: 0) {
                    Text("Don’t have an account? ")
                        .opacity(0.7)
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .onTapGesture {
                            modalManager.activeModal = .signUp
                        }
                }
                .font(.footnote)
                .frame(maxWidth: 335, alignment: .leading)
                
                HStack(spacing: 0) {
                    Text("Forgot password? ")
                        .opacity(0.7)
                    Text("Reset Password")
                        .fontWeight(.semibold)
                        .onTapGesture {
                            modalManager.activeModal = .resetPassword
                        }
                }
                .font(.footnote)
                .frame(maxWidth: 335, alignment: .leading)
            }
            .padding(20)
            
        }
        .frame(width: UIScreen.main.bounds.size.width)
        .background(.white)
        .cornerRadius(30)
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("SUCCESS: You have loged in.")
            }
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(ModalManager())
    }
}
