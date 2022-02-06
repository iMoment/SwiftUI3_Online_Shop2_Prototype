//
//  StaggeredGrid.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/06.
//

import SwiftUI

// Custom View Builder

struct StaggeredGrid<Content: View, T: Identifiable>: View where T: Hashable {
    var content: (T) -> Content
    var list: [T]
    var columns: Int
    
    // MARK: Properties
    var showsIndicators: Bool
    var spacing: CGFloat
    
    init(columns: Int, showsIndicators: Bool = false, spacing: CGFloat = 10, list: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.content = content
        self.list = list
        self.spacing = spacing
        self.showsIndicators = showsIndicators
        self.columns = columns
    }
    
    // Staggered Grid Function
    func setupList() -> [[T]] {
        // Create empty sub arrays of columns count
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        
        // Splitting array for VStack oriented View
        var currentIndex: Int = 0
        
        for object in list {
            gridArray[currentIndex].append(object)
            
            // Increase index count, reset if over columns count
            if currentIndex == (columns - 1) {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        
        return gridArray
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            ForEach(setupList(), id: \.self) { columnsData in
                
                LazyVStack(spacing: spacing) {
                    ForEach(columnsData) { object in
                        content(object)
                    }
                }
            }
        }
        .padding(.vertical)
    }
}

struct StaggeredGrid_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
