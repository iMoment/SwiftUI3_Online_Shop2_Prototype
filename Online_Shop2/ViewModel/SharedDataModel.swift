//
//  SharedDataModel.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/07.
//

import SwiftUI

class SharedDataModel: ObservableObject {
    // MARK: Detail Product Data
    @Published var detailProduct: Product?
    @Published var showDetailProduct: Bool = false
    
    // Matched Geometry Effect from Search page
    @Published var fromSearchPage: Bool = false
    
    // Liked Products
    @Published var likedProducts: [Product] = []
    
    // Cart Products
    @Published var cartProducts: [Product] = []
    
    // Calculating Total price
    func getTotalPrice() -> String {
        var total: Int = 0
        
        cartProducts.forEach { product in
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            
            let quantity = product.quantity
            let priceTotal = quantity * price.integerValue
            
            total += priceTotal
        }
        
        return "$\(total)"
    }
}
