//
//  APIError.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/30/23.
//

import Foundation

enum APIError: Error {
    case notFound
    case downloadError
    case decodingError
}
