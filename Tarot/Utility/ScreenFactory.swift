//
//  ScreenFactory.swift
//  Tarot
//
//  Created by Dmitryi Velko on 19.07.2023.
//

import Foundation
import SwiftUI

enum Screen {
    case mainTab
    case main
//    case prediction
    case savedPredictions
}

final class ScreenFactory {
    
    static let shared = ScreenFactory()

    func createScreen(_ screen: Screen) -> some View {
        switch screen {
        case .mainTab:
            return AnyView(MainTabView())
        case .main:
            return AnyView(MainView(viewModel: MainViewModel()))
//        case .prediction:
//            return AnyView(PredictionView(viewModel: PredictionViewModel()))
        case .savedPredictions:
            return AnyView(SavedPredictionsView())
        }
    }
    
    func createPredictionScreen(cards: [String], predictionText: String) -> some View {
        let predictionViewModel = PredictionViewModel(cards: cards, predictionText: predictionText)
        return AnyView(PredictionView(viewModel: predictionViewModel))
    }
    
    func createPredictionScreen1() {
        
    }
    
}
