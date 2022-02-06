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
    
    // Activate TextField with FocusState
    @FocusState var startTextField: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: Search Bar
            HStack(spacing: 20) {
                // MARK: Close Button
                Button {
                    withAnimation {
                        homeDataVM.searchActivated = false
                    }
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.7))
                }
                
                // MARK: Search Bar
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $homeDataVM.searchText)
                        .focused($startTextField)
                        .textCase(.lowercase)
                        .disableAutocorrection(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .strokeBorder(Color("purple01"), lineWidth: 1.5)
                )
                .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                .padding(.trailing, 20)
            }
            .padding(.horizontal)
            .padding(.top)
            
            // MARK: Filter Results
            ScrollView(.vertical, showsIndicators: false) {
                // MARK: Staggered Grid
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color("homeBG")
                .ignoresSafeArea()
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                startTextField = true
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
