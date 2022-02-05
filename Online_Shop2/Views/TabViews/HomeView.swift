//
//  HomeView.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/05.
//

import SwiftUI

struct HomeView: View {
    @Namespace var animation
    @StateObject var homeViewVM: HomeViewVM = HomeViewVM()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15) {
                // MARK: Search Bar
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: .constant(""))
                        .disabled(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .strokeBorder(Color.gray, lineWidth: 0.8)
                )
                .frame(width: getScreenSize().width / 1.6)
                .padding(.horizontal, 25)
                
                Text("Order online,\nCollect in store!")
                    .font(.custom(customFont, size: 28).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                // MARK: Products Tab
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 18) {
                        ForEach(ProductType.allCases, id: \.self) { type in
                            // MARK: Product Type View
                            ProductTypeView(type: type)
                        }
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top, 28)
                // MARK: Products Page
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 25) {
                        
                        ForEach(homeViewVM.filteredProducts) { product in
                            ProductCardView(product: product)
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom)
                    .padding(.top, 80)
                }
                .padding(.top, 30)
                
                // MARK: See More Button
                Button {
                    homeViewVM.showMoreProductsOnType.toggle()
                } label: {
                    Label {
                        Image(systemName: "arrow.right")
                    } icon: {
                        Text("see more")
                    }
                    .font(.custom(customFont, size: 15).bold())
                    .foregroundColor(Color("purple01"))
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
                .padding(.top, 10)
            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("homeBG"))
        // MARK: Updating data whenever tab changes
        .onChange(of: homeViewVM.productType) { newValue in
            homeViewVM.filterProductByType()
        }
        .sheet(isPresented: $homeViewVM.showMoreProductsOnType) {
            
        } content: {
            MoreProductsView()
        }

    }
    
    @ViewBuilder
    func ProductCardView(product: Product)  -> some View {
        VStack(spacing: 10) {
            Image(product.productImage)
                .resizable()
//                .renderingMode(.)
                .aspectRatio(contentMode: .fit)
                .frame(width: getScreenSize().width / 2.5, height: getScreenSize().width / 2.5)
                .offset(y: -80)
                .padding(.bottom, -80)
            
            Text(product.title)
                .font(.custom(customFont, size: 18))
                .fontWeight(.semibold)
                .padding(.top)
            
            Text(product.subTitle)
                .font(.custom(customFont, size: 14))
                .foregroundColor(Color.gray)
            
            Text(product.price)
                .font(.custom(customFont, size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color("purple01"))
                .padding(.top, 5)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 22)
        .background(
            Color.white
                .cornerRadius(25)
        )
    }
    
    @ViewBuilder
    func ProductTypeView(type: ProductType) -> some View {
        Button {
            withAnimation {
                homeViewVM.productType = type
            }
        } label: {
            Text(type.rawValue)
                .font(.custom(customFont, size: 15))
                .fontWeight(.semibold)
                .foregroundColor(homeViewVM.productType == type ? Color("purple01") : Color.gray)
                .padding(.bottom, 10)
                .overlay(
                    // MARK: Matched Geometry Effect
                    ZStack {
                        if homeViewVM.productType == type {
                            Capsule()
                                .fill(Color("purple01"))
                                .matchedGeometryEffect(id: "PRODUCTTAB", in: animation)
                                .frame(height: 2)
                        } else {
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 2)
                        }
                    }
                    .padding(.horizontal, -5)
                    , alignment: .bottom
                )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
