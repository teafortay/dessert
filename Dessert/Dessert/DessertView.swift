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
        List(content: content)
            .onAppear(perform: viewModel.refresh)
    }
}

private extension DessertView {
  func content() -> some View {
    if let mealList = viewModel.dataSource {
        for dessert in mealList.meals {
            return AnyView(details(for: DessertRowViewModel( item: dessert)))
        }
        return AnyView(loading)
    } else {
      return AnyView(loading)
    }
  }

  func details(for viewModel: DessertRowViewModel) -> some View {
    DessertRow(viewModel: viewModel)
  }

  var loading: some View {
    Text("Loadings weather...")
      .foregroundColor(.gray)
  }
}
