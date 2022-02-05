//
//  Product.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/05.
//

import SwiftUI

// MARK: Product Model
struct Product: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var type: ProductType
    var title: String
    var subTitle: String
    var description: String = ""
    var price: String
    var productImage: String = ""
    var quantity: Int = 1
}

// MARK: Product Types
enum ProductType: String, CaseIterable {
    case wearable = "Wearable"
    case laptops = "Laptops"
    case phones = "Phones"
    case tablets = "Tablets"
}
