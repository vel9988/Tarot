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
    case prediction
    case savedPredictions
}


final class ScreenFactory {
    static let shared = ScreenFactory()

    func createScreen(_ screen: Screen) -> some View {
        switch screen {
        case .mainTab:
            return AnyView(MainTabView())
        case .main:
            return AnyView(MainView())
        case .prediction:
            return AnyView(PredictionView())
        case .savedPredictions:
            return AnyView(SavedPredictionsView())
        }
    }
    
}
