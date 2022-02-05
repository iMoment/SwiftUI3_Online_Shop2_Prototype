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
    
    // Log Status
    @AppStorage("log_Status") var log_Status: Bool = false
    
    // MARK: Login Call
    func login() {
        withAnimation {
            log_Status = true
        }
    }
    
    func register() {
        withAnimation {
            log_Status = true
        }
    }
    
    func forgotPassword() {
        // TODO: Handle action
    }
}
