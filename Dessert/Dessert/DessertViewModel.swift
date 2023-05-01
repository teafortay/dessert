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
    @Published var details: DetailsList?
    private var disposables = Set<AnyCancellable>()
    
    func alphabetical(first: DessertModel, second: DessertModel) -> Bool{
        return first.strMeal < second.strMeal
    }
    
    func refresh() {
      decode()
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
    
    func fetchRecipe(id: String) {
        fetchDetails(id: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
              guard let self = self else { return }
              switch value {
              case .failure:
                self.details = nil
              case .finished:
                break
              }
            }, receiveValue: { [weak self] mealList in
                guard let self = self else { return }
                self.details = mealList
            })
            .store(in: &disposables)
    }
}
