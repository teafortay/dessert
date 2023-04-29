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
  let idMeal: Int
}

extension DessertModel: Identifiable {
  var id: String { strMeal }
}

func decode() -> AnyPublisher<DessertModel, APIError> {
  guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
    fatalError("Error on creating url")
  }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
  return URLSession.shared.dataTaskPublisher(for: url)
    .mapError { _ in APIError.downloadError }
    .map { data, _ in data }
    .decode(type: DessertModel.self, decoder: decoder)
    .mapError { _ in APIError.decodingError }
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
