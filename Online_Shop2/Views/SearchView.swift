//
//  SearchView.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/06.
//

import SwiftUI

struct SearchView: View {
    var animation: Namespace.ID
    @EnvironmentObject var homeDataVM: HomeViewVM
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: Search Bar
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("homeBG")
                .ignoresSafeArea()
        )
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
