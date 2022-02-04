//
//  OnBoardingPage.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/04.
//

import SwiftUI

let customFont = "Raleway-Regular"

struct OnBoardingPage: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Find your\nGadget")
                .font(.custom(customFont, size: 55))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            Image("onboardBg")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button {
                
            } label: {
                Text("Get Started")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("purple01"))
            }
            .padding(.horizontal, 30)
            
            .offset(y: getScreenSize().height < 750 ? 20 : 40)
            
            Spacer()
        }
        .padding()
        .padding(.top, getScreenSize().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("purple01")
        )
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
    }
}
