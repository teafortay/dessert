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
        List {
            if let mealList = viewModel.dataSource {
                ForEach(mealList.meals, id: \.id) {dessert in
                    dessertRow(dessert)
                }
            } else {
                AnyView(loading)
            }
        }
        .onAppear(perform: viewModel.refresh)
    }
}

private extension DessertView {
    
    func dessertRow(_ meal: DessertModel) -> some View {
        let viewmodel = DessertRowViewModel(item: meal)
        return AnyView(DessertRow(viewModel: viewmodel))
    }
    
    var loading: some View {
        Text("Loading data...")
            .foregroundColor(.gray)
    }
}
