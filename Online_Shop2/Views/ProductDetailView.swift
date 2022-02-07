//
//  ProductDetailView.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/07.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
    // Shared Data Model
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        VStack {
            
            // MARK: Title Bar & Product Image
            VStack {
                
            }
            .frame(height: getScreenSize().height / 2.7)
            
            // MARK: Product Details
            ScrollView(.vertical, showsIndicators: false) {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                // Corner Radius
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
                    .ignoresSafeArea()
            )
        }
        .background(Color("homeBG").ignoresSafeArea())
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: HomeViewVM().products[0])
            .environmentObject(SharedDataModel())
    }
}
