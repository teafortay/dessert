//
//  DessertApp.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/27/23.
//

import SwiftUI


@main
struct DessertApp: App {
    let viewmodel = DessertViewModel()
    var body: some Scene {
        WindowGroup {
            DessertView(viewModel: viewmodel)
            
        }
    }
}
