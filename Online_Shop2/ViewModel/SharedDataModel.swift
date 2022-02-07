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
}
