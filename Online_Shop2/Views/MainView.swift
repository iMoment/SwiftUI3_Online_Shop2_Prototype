//
//  MainView.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/05.
//

import SwiftUI

struct MainView: View {
    @State var currentTab: Tab = .home
    @StateObject var sharedData: SharedDataModel = SharedDataModel()
    
    @Namespace var animation
    
    // Hiding Tab Bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        // MARK: Tab View
        VStack(spacing: 0) {
            
            TabView(selection: $currentTab) {
                
                HomeView(animation: animation)
                    .environmentObject(sharedData)
                    .tag(Tab.home)
                
                LikedPage()
                    .environmentObject(sharedData)
                    .tag(Tab.liked)
                
                ProfilePage()
                    .tag(Tab.profile)
                
                Text("Cart")
                    .tag(Tab.cart)
            }
            
            // MARK: Custom Tab Bar
            HStack(spacing: 0) {
                
                ForEach(Tab.allCases, id: \.self) { tab in
                    
                    Button {
                        currentTab = tab
                    } label: {
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .background(
                                Color("purple01")
                                    .opacity(0.1)
                                    .cornerRadius(5)
                                    .blur(radius: 5)
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color("purple01") : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 10)
        }
        .background(Color("homeBG").ignoresSafeArea())
        .overlay(
            ZStack {
                // MARK: Detail Page
                if let product = sharedData.detailProduct, sharedData.showDetailProduct {
                    ProductDetailView(product: product, animation: animation)
                        .environmentObject(sharedData)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

enum Tab: String, CaseIterable {
    case home = "house.fill"
    case liked = "heart.fill"
    case profile = "person.fill"
    case cart = "cart.fill"
}
