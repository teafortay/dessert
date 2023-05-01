//
//  DessertDetailView.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/30/23.
//

import SwiftUI
import Foundation

struct DessertDetailView: View {
    
    @ObservedObject var viewModel: DessertDetailViewModel
    
    init(viewModel: DessertDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text(viewModel.name)
                    .bold()
                
                HStack {
                    Text("Ingredients:")
                    Spacer()
                }
                .padding()
                    ingredients()
                
                HStack {
                    Text("Instructions:")
                    Spacer()
                }
                .padding()
                
                Text(viewModel.instructions)
                    .padding()
            }
        }
            .onAppear {
                viewModel.fetchRecipe(id: viewModel.idMeal)
            }
    }
    
    func ingredients() -> some View {
        let ingredients = viewModel.buildIngredients()
        var displayValues: [String] = []
        for i in 0...19 {
            if ingredients[i] != "" {
                displayValues.append(ingredients[i])
            }
        }
        return VStack {
            ForEach(displayValues, id: \.self) { value in
                Text(value)
            }
        }
    }
}
//
//struct DessertDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DessertDetailView()
//    }
//}
