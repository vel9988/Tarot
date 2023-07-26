//
//  Coordinator.swift
//  Tarot
//
//  Created by Dmitryi Velko on 20.07.2023.
//

import SwiftUI

enum Page: String, Identifiable {
    case main
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case prediction
    
    var id: String {
        self.rawValue
    }
}

open class Coordinator: ObservableObject {
    
    @Published var prediction: Prediction = Prediction()
    
    @State var authState: Bool = false
    
    @Published var path = NavigationPath()
    @Published var fullScreenCover: FullScreenCover?
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .main:
            ScreenFactory.shared.createScreen(.mainTab)
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .prediction:
            NavigationStack {
                ScreenFactory.shared.createPredictionScreen(cards: Array(prediction.cards),
                                                            predictionText: prediction.predictionText)
            }
        }
    }
    
}
