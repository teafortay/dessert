//
//  DessertRow.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/30/23.
//

import Foundation
import SwiftUI

struct DessertRow: View {
    private let viewModel: DessertRowViewModel
    
    init(viewModel: DessertRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(viewModel.name)
    }
}
