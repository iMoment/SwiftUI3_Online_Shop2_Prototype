//
//  LoginPageVM.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/04.
//

import SwiftUI

class LoginPageVM: ObservableObject {
    // MARK: Login Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    // MARK: Register Properties
    @Published var registerUser: Bool = false
    @Published var confirmPassword: String = ""
    @Published var showConfirmPassword: Bool = false
    
    // MARK: Login Call
    func login() {
        // TODO: Handle action
    }
    
    func register() {
        // TODO: Handle action
    }
    
    func forgotPassword() {
        // TODO: Handle action
    }
}
