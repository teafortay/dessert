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
                image
                    .frame(width: 50, height: 50)
                    .padding()
//                    .scaledToFit()
                
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
        let measurements = viewModel.buildMeasurements()
        var displayValues: [String] = []
        
        for i in 0...19 {
            if ingredients[i] != ""  && measurements[i] != "" {
                displayValues.append("\(ingredients[i]), \(measurements[i])")
            }
        }
        return VStack {
            ForEach(displayValues, id: \.self) { value in
                Text("- \(value)")
            }
        }
    }
    
    @ViewBuilder
    var image: some View {
        AsyncImage(url: URL(string: viewModel.imageUrl))
    }
}
