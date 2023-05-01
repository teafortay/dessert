//
//  DessertView.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/30/23.
//

import Foundation
import SwiftUI

struct DessertView: View {
    @ObservedObject var viewModel: DessertViewModel
    
    init(viewModel: DessertViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                if let mealList = viewModel.dataSource {
                    let meals = mealList.meals.sorted(by: viewModel.alphabetical)
                    ForEach(meals, id: \.id) {dessert in
                        NavigationLink(destination:dessertDetail(dessert)) {
                            dessertRow(dessert)
                        }
                        .onTapGesture {
                            viewModel.fetchRecipe(id: dessert.idMeal)
                        }
                    }
                } else {
                    AnyView(loading)
                }
            }
            .onAppear(perform: viewModel.refresh)
        }
    }
}

private extension DessertView {
    
    func dessertRow(_ meal: DessertModel) -> some View {
        let viewmodel = DessertRowViewModel(item: meal)
        return AnyView(DessertRow(viewModel: viewmodel))
    }
    
    func dessertDetail(_ meal: DessertModel) -> some View {
        if let details = viewModel.details {
            let viewmodel = DessertDetailViewModel(item: details.meals[0])
            return AnyView(DessertDetailView(viewModel: viewmodel))
        } else {
            return AnyView(loading)
        }
    }
    var loading: some View {
        Text("Loading data...")
            .foregroundColor(.gray)
    }
}
