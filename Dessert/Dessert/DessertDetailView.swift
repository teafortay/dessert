//
//  DessertDetailView.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/30/23.
//

import SwiftUI

struct DessertDetailView: View {
    
    private let viewModel: DessertDetailViewModel
    
    init(viewModel: DessertDetailViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text(viewModel.name)
    }
}
//
//struct DessertDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DessertDetailView()
//    }
//}
