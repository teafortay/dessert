//
//  DessertDetailViewModel.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/30/23.
//

import Foundation
import Combine

class DessertDetailViewModel: ObservableObject {
    
    var idMeal: String
    @Published var recipe: DessertDetail?
    private var disposables = Set<AnyCancellable>()
    
    init(idMeal: String) {
        self.idMeal = idMeal
        
    }
    func fetchRecipe(id: String) {
        fetchDetails(id: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
              guard let self = self else { return }
              switch value {
              case .failure:
                self.recipe = nil
              case .finished:
                break
              }
            }, receiveValue: { [weak self] mealList in
                guard let self = self else { return }
                self.recipe = mealList.meals[0]
            })
            .store(in: &disposables)
    }
    
    var name: String {
        return recipe?.strMeal ?? "No meal name"
    }
    
    var instructions: String {
        return recipe?.strInstructions ?? "No instructions"
    }
    
    func buildIngredients() -> [String] {
        if let recipe = recipe {
            let ingredients: [String] = [
                recipe.strIngredient1 ?? "",
                recipe.strIngredient2 ?? "",
                recipe.strIngredient3 ?? "",
                recipe.strIngredient4 ?? "",
                recipe.strIngredient5 ?? "",
                recipe.strIngredient6 ?? "",
                recipe.strIngredient7 ?? "",
                recipe.strIngredient8 ?? "",
                recipe.strIngredient9 ?? "",
                recipe.strIngredient10 ?? "",
                recipe.strIngredient11 ?? "",
                recipe.strIngredient12 ?? "",
                recipe.strIngredient13 ?? "",
                recipe.strIngredient14 ?? "",
                recipe.strIngredient15 ?? "",
                recipe.strIngredient16 ?? "",
                recipe.strIngredient17 ?? "",
                recipe.strIngredient18 ?? "",
                recipe.strIngredient19 ?? "",
                recipe.strIngredient20 ?? "",
            ]
            return ingredients
        } else {
            return ["", "", "", "", "",
                    "", "", "", "", "",
                    "", "", "", "", "",
                    "", "", "", "", ""]
        }
    }
        
    func buildMeasurements() -> [String] {
        if let recipe = recipe {
            let measurements: [String] = [
                recipe.strMeasure1 ?? "",
                recipe.strMeasure2 ?? "",
                recipe.strMeasure3 ?? "",
                recipe.strMeasure4 ?? "",
                recipe.strMeasure5 ?? "",
                recipe.strMeasure6 ?? "",
                recipe.strMeasure7 ?? "",
                recipe.strMeasure8 ?? "",
                recipe.strMeasure9 ?? "",
                recipe.strMeasure10 ?? "",
                recipe.strMeasure11 ?? "",
                recipe.strMeasure12 ?? "",
                recipe.strMeasure13 ?? "",
                recipe.strMeasure14 ?? "",
                recipe.strMeasure15 ?? "",
                recipe.strMeasure16 ?? "",
                recipe.strMeasure17 ?? "",
                recipe.strMeasure18 ?? "",
                recipe.strMeasure19 ?? "",
                recipe.strMeasure20 ?? "",
            ]
            return measurements
        } else {
            return  ["", "", "", "", "",
                     "", "", "", "", "",
                     "", "", "", "", "",
                     "", "", "", "", ""]
        }
        
    }
}
