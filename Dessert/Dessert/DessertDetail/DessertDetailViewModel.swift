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
    
    @Published var details: DetailsList?
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
    
    var name: String {
        if let details = details?.meals {
            let item = details[0]
            return item.strMeal
        } else {
            return "loads"
        }
    }
}
