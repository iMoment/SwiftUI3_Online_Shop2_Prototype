//
//  HomeViewVM.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/05.
//

import SwiftUI

class HomeViewVM: ObservableObject {
    @Published var productType: ProductType = .wearable
    
    @Published var products: [Product] = [
        Product(type: .wearable, title: "Apple Watch", subTitle: "Series 6: Red", price: "$359", productImage: "appleWatch6"),
        Product(type: .wearable, title: "Samsung Watch", subTitle: "Gear: Black", price: "$180", productImage: "samsungWatch"),
        Product(type: .wearable, title: "Apple Watch", subTitle: "Series 4: Black", price: "$250", productImage: "appleWatch4"),
        Product(type: .phones, title: "iPhone 13", subTitle: "A15 - Pink", price: "$699", productImage: "iPhone13"),
        Product(type: .phones, title: "iPhone 12", subTitle: "A14 - Blue", price: "$599", productImage: "iPhone12"),
        Product(type: .phones, title: "iPhone 11", subTitle: "A13 - Purple", price: "$499", productImage: "iPhone11"),
        Product(type: .phones, title: "iPhone SE 2", subTitle: "A13 - White", price: "$399", productImage: "iPhoneSE"),
        Product(type: .laptops, title: "MacBook Air", subTitle: "M1 - Gold", price: "$999", productImage: "macbookAir"),
        Product(type: .laptops, title: "MacBook Pro", subTitle: "M1 - Space Grey", price: "$1299", productImage: "macbookPro"),
        Product(type: .tablets, title: "iPad Pro", subTitle: "M1 - Silver", price: "$999", productImage: "ipadPro"),
        Product(type: .tablets, title: "iPad Air 4", subTitle: "A14 - Pink", price: "$699", productImage: "ipadAir"),
        Product(type: .tablets, title: "iPad Mini", subTitle: "A15 - Grey", price: "$599", productImage: "ipadMini"),
        Product(type: .laptops, title: "iMac", subTitle: "M1 - Purple", price: "$1599", productImage: "iMac")
    ]
    
    // MARK: Filter Products
    @Published var filteredProducts: [Product] = []
    @Published var showMoreProductsOnType: Bool = false
    
    // MARK: Search Data
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    
    init() {
        filterProductByType()
    }
    
    func filterProductByType() {
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
                .lazy
                .filter { product in
                    return product.type == self.productType
                }
                .prefix(4)
            
            DispatchQueue.main.async {
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
}





























