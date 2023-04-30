//
//  DessertRowViewModel.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/30/23.
//

import Foundation

struct DessertRowViewModel {
    private let item: DessertModel
    
    var name: String {
        return item.strMeal
    }
    init(item: DessertModel) {
      self.item = item
    }
}
