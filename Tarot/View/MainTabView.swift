//
//  MainTabView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 18.07.2023.
//

import SwiftUI

struct MainTabView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.brown
    }
    
    var body: some View {
        TabView {
            ScreenFactory.shared.createScreen(.main)
                .tabItem {
                    Label("Home", image: RApp.Icons.magicBall)
                    }
                                
            ScreenFactory.shared.createScreen(.savedPredictions)
                .tabItem {
                    Label("Predictions", image: RApp.Icons.list)
                }
        }
        .tint(.white)
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
