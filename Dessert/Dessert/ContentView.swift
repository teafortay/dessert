//
//  ContentView.swift
//  Dessert
//
//  Created by Taylor Shaw on 4/27/23.
//

import SwiftUI
import Combine

class DessertViewModel: ObservableObject {
    @Published var dataSource: DessertRowViewModel?
    private var disposables = Set<AnyCancellable>()
    
    func refresh() {
      decode()
        .map(DessertRowViewModel.init)
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] value in
          guard let self = self else { return }
          switch value {
          case .failure:
            self.dataSource = nil
          case .finished:
            break
          }
        }, receiveValue: { [weak self] dessert in
            guard let self = self else { return }
            self.dataSource = dessert
        })
        .store(in: &disposables)
    }
}

struct DessertRowViewModel {
    private let item: DessertModel
    init(item: DessertModel) {
      self.item = item
    }
}
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
    if let viewModel = viewModel.dataSource {
      return AnyView(details(for: viewModel))
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

struct DessertRow: View {
    private let viewModel: DessertRowViewModel
    
    init(viewModel: DessertRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("yummy dessert")
    }
}

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
