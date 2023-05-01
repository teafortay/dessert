//
//  Fetcher.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/30/23.
//

import Foundation
import Combine

let decoder = JSONDecoder()

func decode() -> AnyPublisher<MealList, APIError> {
  guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
    fatalError("Error on creating url")
  }
  return URLSession.shared.dataTaskPublisher(for: url)
    .mapError { _ in APIError.downloadError }
    .map { data, _ in data }
    .decode(type: MealList.self, decoder: decoder)
    .mapError { error in
        print(error)
        return APIError.decodingError }
    .eraseToAnyPublisher()
}

func fetchDetails(id: String) -> AnyPublisher<DetailsList, APIError> {
    guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=" + id) else {
      fatalError("Error on creating url")
    }
    return URLSession.shared.dataTaskPublisher(for: url)
      .mapError { _ in APIError.downloadError }
      .map { data, _ in data }
      .decode(type: DetailsList.self, decoder: decoder)
      .mapError { error in
          print(error)
          return APIError.decodingError }
      .eraseToAnyPublisher()
}
