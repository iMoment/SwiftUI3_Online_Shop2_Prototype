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
            
            ScrollView(.vertical, showsIndicators: false) {
                
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
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
