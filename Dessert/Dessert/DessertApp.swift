//
//  DessertApp.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/27/23.
//

import SwiftUI
import Combine

enum APIError: Error {
    case notFound
    case downloadError
    case decodingError
}

struct DessertModel: Decodable, Equatable {
  let strMeal: String
  let strMealThumb: String
  let idMeal: String
}

struct MealList: Decodable {
    let meals: [DessertModel]
}

extension DessertModel: Identifiable {
  var id: String { strMeal }
}
let decoder = JSONDecoder()
func decode() -> AnyPublisher<MealList, APIError> {
  guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
    fatalError("Error on creating url")
  }
//    decoder.keyDecodingStrategy = .convertFromSnakeCase
  return URLSession.shared.dataTaskPublisher(for: url)
    .mapError { _ in APIError.downloadError }
    .map { data, _ in data }
    .decode(type: MealList.self, decoder: decoder)
    .mapError { error in
        print(error)
        return APIError.decodingError }
    .eraseToAnyPublisher()
}

@main
struct DessertApp: App {
    let viewmodel = DessertViewModel()
    var body: some Scene {
        WindowGroup {
            DessertView(viewModel: viewmodel)
            
        }
    }
}
