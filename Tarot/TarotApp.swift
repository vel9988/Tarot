//
//  TarotApp.swift
//  Tarot
//
//  Created by Dmitryi Velko on 11.07.2023.
//

import SwiftUI

@main
struct TarotApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .preferredColorScheme(.light)
        }
    }
}
