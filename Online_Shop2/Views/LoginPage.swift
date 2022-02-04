//
//  LoginPage.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/04.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginPageVM: LoginPageVM = LoginPageVM()
    
    var body: some View {
        VStack {
            
            Text("Welcome\nback")
                .font(.custom(customFont, size: 55).bold())
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: getScreenSize().height / 3.5)
                .padding()
                .background(
                    ZStack {
                        LinearGradient(colors: [
                            Color("pink01"),
                            Color("pink01").opacity(0.8),
                            Color("purple01")
                        ], startPoint: .top, endPoint: .bottom)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding(.trailing)
                            .offset(y: -25)
                            .ignoresSafeArea()
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding(30)
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                            .frame(width: 23, height: 23)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(.leading, 30)
                    }
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                // MARK: Login Form
                VStack(spacing: 15) {
                    Text(loginPageVM.registerUser ? "Register" : "Login")
                        .font(.custom(customFont, size: 22).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Custom Text Field
                    CustomTextField(icon: "envelope", title: "Email", hint: "onetwothreefour", value: $loginPageVM.email, showPassword: .constant(false))
                        .padding(.top, 30)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "123456", value: $loginPageVM.password, showPassword: $loginPageVM.showPassword)
                        .padding(.top, 10)
                    
                    // Register confirm password
                    if loginPageVM.registerUser {
                        CustomTextField(icon: "envelope", title: "Confirm Password", hint: "123456", value: $loginPageVM.confirmPassword, showPassword: $loginPageVM.showConfirmPassword)
                            .padding(.top, 10)
                    }
                    
                    // MARK: Forgot Password Button
                    Button {
                        loginPageVM.forgotPassword()
                    } label: {
                        Text("Forgot password?")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("purple01"))
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // MARK: Login Button
                    Button {
                        if loginPageVM.registerUser {
                            loginPageVM.register()
                        } else {
                            loginPageVM.login()
                        }
                    } label: {
                        Text("Login")
                            .font(.custom(customFont, size: 17).bold())
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .background(Color("purple01"))
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                    }
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    // MARK: Register User Button
                    Button {
                        withAnimation {
                            loginPageVM.registerUser.toggle()
                        }
                    } label: {
                        Text(loginPageVM.registerUser ? "Back to Login" : "Create account")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("purple01"))
                    }
                    .padding(.top, 8)
                    
                }
                .padding(30)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
                    .ignoresSafeArea()
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("purple01"))
        
        // MARK: Clear data
        .onChange(of: loginPageVM.registerUser) { _ in
            loginPageVM.email = ""
            loginPageVM.password = ""
            loginPageVM.confirmPassword = ""
            loginPageVM.showPassword = false
            loginPageVM.showConfirmPassword = false
        }
    }
    
    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Label {
                Text(title)
                    .font(.custom(customFont, size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue {
                SecureField(hint, text: value)
                    .padding(.top, 2)
            } else {
                TextField(hint, text: value)
                    .padding(.top, 2)
            }
            
            Divider()
                .background(Color.black.opacity(0.4))
        }
        // MARK: Show Button for password field
        .overlay(
            Group {
                if title.contains("Password") {
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .font(.custom(customFont, size: 13).bold())
                            .foregroundColor(Color("purple01"))
                    })
                    .offset(y: 8)
                }
            }
            , alignment: .trailing
        )
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
