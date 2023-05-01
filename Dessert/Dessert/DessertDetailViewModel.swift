//
//  DessertDetailViewModel.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/30/23.
//

import Foundation
struct DessertDetailViewModel {
    private let item: DessertDetail
    
    var name: String {
        return item.strMeal
    }
    init(item: DessertDetail) {
        self.item = item
    }
}
