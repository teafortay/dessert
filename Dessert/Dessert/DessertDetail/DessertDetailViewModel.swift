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
}
