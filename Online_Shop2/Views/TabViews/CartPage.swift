//
//  CartPage.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/07.
//

import SwiftUI

struct CartPage: View {
    @EnvironmentObject var sharedData: SharedDataModel
    
    // MARK: Delete Option
    @State var showDeleteOption: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        HStack {
                            Text("Basket")
                                .font(.custom(customFont, size: 28).bold())
                            
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    showDeleteOption.toggle()
                                }
                            } label: {
                                Image(systemName: "trash")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(Color.red)
                            }
                            .opacity(sharedData.cartProducts.isEmpty ? 0 : 1)
                        }
                        // Check if liked products are empty
                        if sharedData.cartProducts.isEmpty {
                            Group {
                                Image("notFound")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .padding(.top, 35)
                                
                                Text("No Items added")
                                    .font(.custom(customFont, size: 25))
                                    .fontWeight(.semibold)
                                
                                Text("Hit the plus button to save into basket.")
                                    .font(.custom(customFont, size: 18))
                                    .foregroundColor(Color.gray)
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                                    .multilineTextAlignment(.center)
                            }
                        } else {
                            // Displaying Liked Products
                            VStack(spacing: 15) {
                                ForEach(sharedData.cartProducts) { product in
                                    HStack(spacing: 0) {
                                        if showDeleteOption {
                                            Button {
                                                deleteProduct(product: product)
                                            } label: {
                                                Image(systemName: "minus.circle.fill")
                                                    .font(.title2)
                                                    .foregroundColor(Color.red)
                                            }
                                            .padding(.trailing)
                                        }
                                        CardView(product: product)
                                    }
                                }
                            }
                            .padding(.top, 25)
                            .padding(.horizontal)
                        }
                    }
                    .padding()
                }
                // Showing Total and Check out Button
                if sharedData.cartProducts.isEmpty {
                    Group {
                        HStack {
                            Text("Total")
                                .font(.custom(customFont, size: 14))
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text("$399")
                                .font(.custom(customFont, size: 18).bold())
                                .foregroundColor(Color("purple01"))
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Checkout")
                                .font(.custom(customFont, size: 18).bold())
                                .foregroundColor(Color.white)
                                .padding(.vertical, 18)
                                .frame(maxWidth: .infinity)
                                .background(Color("purple01"))
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                        }
                        .padding(.horizontal, 25)
                        .padding(.vertical)
                    }
                }
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("homeBG")
                    .ignoresSafeArea()
            )
        }
    }
    
    @ViewBuilder
    func CardView(product: Product) -> some View {
        HStack(spacing: 15) {
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.custom(customFont, size: 18).bold())
                    .lineLimit(1)
                
                Text(product.subTitle)
                    .font(.custom(customFont, size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("purple01"))
                
                Text("Type: \(product.type.rawValue)")
                    .font(.custom(customFont, size: 13))
                    .foregroundColor(Color.gray)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color.white
                .cornerRadius(10)
        )
    }
    
    func deleteProduct(product: Product) {
        if let index = sharedData.cartProducts.firstIndex(where: { currentProduct in
            return product.id == currentProduct.id
        }) {
            let _ = withAnimation {
                sharedData.cartProducts.remove(at: index)
            }
        }
    }
}

struct CartPage_Previews: PreviewProvider {
    static var previews: some View {
        CartPage()
    }
}
