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
                Text(viewModel.instructions)
                    .padding()
            }
        }
            .onAppear {
                viewModel.fetchRecipe(id: viewModel.idMeal)
            }
    }
}
//
//struct DessertDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DessertDetailView()
//    }
//}
