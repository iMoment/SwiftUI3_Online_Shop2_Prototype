//
//  SearchView.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/06.
//

import SwiftUI

struct SearchView: View {
    var animation: Namespace.ID
    @EnvironmentObject var sharedData: SharedDataModel
    @EnvironmentObject var homeViewVM: HomeViewVM
    
    // Activate TextField with FocusState
    @FocusState var startTextField: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: Search Bar
            HStack(spacing: 20) {
                // MARK: Close Button
                Button {
                    withAnimation {
                        homeViewVM.searchActivated = false
                    }
                    homeViewVM.searchText = ""
                    // MARK: Reset
                    sharedData.fromSearchPage = false
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
                    
                    TextField("Search", text: $homeViewVM.searchText)
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
            .padding([.horizontal])
            .padding(.top)
            .padding(.bottom, 10)
            
            // Show progress if searching
            if let products = homeViewVM.searchedProducts {
                if products.isEmpty {
                    // No Results
                    VStack(spacing: 10) {
                        Image("notFound")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.top, 60)
                        
                        Text("Item Not Found")
                            .font(.custom(customFont, size: 22).bold())
                        
                        Text("Try a more generic search term or try looking for alternative products.")
                            .font(.custom(customFont, size: 16))
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                    }
                    .padding()
                } else {
                    // MARK: Filter Results
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            // Found Text
                            Text("Found \(products.count) results")
                                .font(.custom(customFont, size: 24).bold())
                                .padding(.vertical)
                            
                            // MARK: Staggered Grid
                            StaggeredGrid(columns: 2, spacing: 20, list: products) { product in
                                // MARK: Card View
                                ProductCardView(product: product)
                            }
                        }
                        .padding()
                    }
                }
            } else {
                ProgressView()
                    .padding(.top, 30)
                    .opacity(homeViewVM.searchText == "" ? 0 : 1)
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
    
    @ViewBuilder
    func ProductCardView(product: Product)  -> some View {
        VStack(spacing: 10) {
            ZStack {
                if sharedData.showDetailProduct {
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0)
                } else {
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(product.id)SEARCH", in: animation)
                }
            }
            .offset(y: -50)
            .padding(.bottom, -50)
            
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
        .padding(.top, 50)
        // Showing Product Detail when tapped
        .onTapGesture {
            withAnimation(.easeInOut) {
                sharedData.fromSearchPage = true
                sharedData.detailProduct = product
                sharedData.showDetailProduct = true
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
