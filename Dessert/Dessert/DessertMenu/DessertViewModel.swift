//
//  DessertViewModel.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/30/23.
//

import Foundation
import Combine

class DessertViewModel: ObservableObject {
    
    @Published var dataSource: MealList?
    private var disposables = Set<AnyCancellable>()
    
    func alphabetical(first: DessertModel, second: DessertModel) -> Bool{
        return first.strMeal < second.strMeal
    }
    
    func refresh() {
      fetchMeals()
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] value in
          guard let self = self else { return }
          switch value {
          case .failure:
            self.dataSource = nil
          case .finished:
            break
          }
        }, receiveValue: { [weak self] mealList in
            guard let self = self else { return }
            self.dataSource = mealList
        })
        .store(in: &disposables)
    }
    
}
