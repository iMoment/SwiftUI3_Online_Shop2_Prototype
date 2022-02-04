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
        VStack {
            Text("Find your\nGadget")
                .font(.custom(customFont, size: 55))
        }
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
