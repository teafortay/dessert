//
//  Responses.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/30/23.
//

import Foundation

struct MealList: Decodable {
    let meals: [DessertModel]
}

struct DessertModel: Decodable, Equatable {
  let strMeal: String
  let strMealThumb: String
  let idMeal: String
}

extension DessertModel: Identifiable {
  var id: String { idMeal }
}
