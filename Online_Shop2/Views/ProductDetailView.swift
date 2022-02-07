//
//  ProductDetailView.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/07.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    var animation: Namespace.ID
    
    // Shared Data Model
    @EnvironmentObject var sharedData: SharedDataModel
    @EnvironmentObject var homeViewVM: HomeViewVM
    
    var body: some View {
        VStack {
            
            // MARK: Title Bar & Product Image
            VStack {
                // MARK: Title Bar
                HStack {
                    Button {
                        withAnimation(.easeInOut) {
                            sharedData.showDetailProduct = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    Button {
                        addToLiked()
                    } label: {
                        Image(systemName: "heart.fill")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .foregroundColor(isLiked() ? Color.red : Color.black.opacity(0.7))
                    }
                }
                .padding()
                
                // MARK: Product Image
                Image(product.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "\(product.id)\(sharedData.fromSearchPage ? "SEARCH" : "IMAGE")", in: animation)
                    .padding(.horizontal)
                    .offset(y: -12)
                    .frame(maxHeight: .infinity)
            }
            .frame(height: getScreenSize().height / 2.7)
            .zIndex(1)
            
            // MARK: Product Details
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 15) {
                    Text(product.title)
                        .font(.custom(customFont, size: 20).bold())
                    
                    Text(product.subTitle)
                        .font(.custom(customFont, size: 18))
                        .foregroundColor(Color.gray)
                    
                    Text("Get Apple TV+ free for a year")
                        .font(.custom(customFont, size: 16).bold())
                        .padding(.top)
                    
                    Text("Available when you purchase any new iPhone, iPad, iPod Touch, Mac or Apple TV, $4.99/month after free trial.")
                        .font(.custom(customFont, size: 15))
                        .foregroundColor(Color.gray)
                    
                    Button {
                        
                    } label: {
                        Label {
                            Image(systemName: "arrow.right")
                        } icon: {
                            Text("Full description")
                        }
                        .font(.custom(customFont, size: 15).bold())
                        .foregroundColor(Color("purple01"))
                    }
                    
                    HStack {
                        Text("Total")
                            .font(.custom(customFont, size: 17))
                        
                        Spacer()
                        
                        Text("\(product.price)")
                            .font(.custom(customFont, size: 20).bold())
                            .foregroundColor(Color("purple01"))
                    }
                    .padding(.vertical, 20)
                    
                    Button {
                        addToCart()
                    } label: {
                        Text("\(isAddedToCart() ? "added" : "add")to basket")
                            .font(.custom(customFont, size: 20).bold())
                            .foregroundColor(Color.white)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(
                                Color("purple01")
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                            )
                    }
                }
                .padding([.horizontal, .bottom], 25)
                .padding(.top, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                // Corner Radius
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
                    .ignoresSafeArea()
            )
            .zIndex(0)
        }
        .animation(.easeInOut, value: sharedData.likedProducts)
        .animation(.easeInOut, value: sharedData.cartProducts)
        .background(Color("homeBG").ignoresSafeArea())
    }
    
    func isLiked() -> Bool {
        return sharedData.likedProducts.contains { product in
            return self.product.id == product.id
        }
    }
    
    func isAddedToCart() -> Bool {
        return sharedData.cartProducts.contains { product in
            return self.product.id == product.id
        }
    }
    
    func addToLiked() {
        if let index = sharedData.likedProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }) {
            sharedData.likedProducts.remove(at: index)
        } else {
            sharedData.likedProducts.append(product)
        }
    }
    
    func addToCart() {
        if let index = sharedData.cartProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }) {
            sharedData.cartProducts.remove(at: index)
        } else {
            sharedData.cartProducts.append(product)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
//        ProductDetailView(product: HomeViewVM().products[0])
//            .environmentObject(SharedDataModel())
        MainView()
    }
}
