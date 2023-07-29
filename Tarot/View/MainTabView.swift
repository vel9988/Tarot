//
//  MainTabView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 18.07.2023.
//

import SwiftUI

struct MainTabView: View {
    
    init() {
        // TODO: - подобрать цвет к табВью
        UITabBar.appearance().backgroundColor = UIColor.brown
    }
    
    var body: some View {
        TabView {
            ScreenFactory.shared.createScreen(.main)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ScreenFactory.shared.createScreen(.savedPredictions)
                .tabItem {
                    Label("Predictions", systemImage: "list.bullet.rectangle.portrait.fill")
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
