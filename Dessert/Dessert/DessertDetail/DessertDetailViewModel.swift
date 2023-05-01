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
    
    func buildIngredients() -> [Int: String] {
        let ingredients: [Int : String] = [
            1: recipe?.strIngredient1 ?? "",
            2: recipe?.strIngredient2 ?? "",
            3: recipe?.strIngredient3 ?? "",
            4: recipe?.strIngredient4 ?? "",
            5: recipe?.strIngredient5 ?? "",
            6: recipe?.strIngredient6 ?? "",
            7: recipe?.strIngredient7 ?? "",
            8: recipe?.strIngredient8 ?? "",
            9: recipe?.strIngredient9 ?? "",
            10: recipe?.strIngredient10 ?? "",
            11: recipe?.strIngredient11 ?? "",
            12: recipe?.strIngredient12 ?? "",
            13: recipe?.strIngredient13 ?? "",
            14: recipe?.strIngredient14 ?? "",
            15: recipe?.strIngredient15 ?? "",
            16: recipe?.strIngredient16 ?? "",
            17: recipe?.strIngredient17 ?? "",
            18: recipe?.strIngredient18 ?? "",
            19: recipe?.strIngredient19 ?? "",
            20: recipe?.strIngredient20 ?? "",
        ].filter({ $0.value != "" })
        return ingredients
    }
        
    func buildMeasurements() -> [Int: String] {
        let measurements:  [Int : String] = [
            1: recipe?.strMeasure1 ?? "",
            2: recipe?.strMeasure2 ?? "",
            3: recipe?.strMeasure3 ?? "",
            4: recipe?.strMeasure4 ?? "",
            5: recipe?.strMeasure5 ?? "",
            6: recipe?.strMeasure6 ?? "",
            7: recipe?.strMeasure7 ?? "",
            8: recipe?.strMeasure8 ?? "",
            9: recipe?.strMeasure9 ?? "",
            10: recipe?.strMeasure10 ?? "",
            11: recipe?.strMeasure11 ?? "",
            12: recipe?.strMeasure12 ?? "",
            13: recipe?.strMeasure13 ?? "",
            14: recipe?.strMeasure14 ?? "",
            15: recipe?.strMeasure15 ?? "",
            16: recipe?.strMeasure16 ?? "",
            17: recipe?.strMeasure17 ?? "",
            18: recipe?.strMeasure18 ?? "",
            19: recipe?.strMeasure19 ?? "",
            20: recipe?.strMeasure20 ?? "",
        ].filter({ $0.value != "" })
        return measurements
        
    }
}
