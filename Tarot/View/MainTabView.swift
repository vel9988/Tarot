//
//  MainTabView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 18.07.2023.
//

import SwiftUI

struct MainTabView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(.black)
    }
    
    var body: some View {
        TabView {
            ScreenFactory.shared.createScreen(.main)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ScreenFactory.shared.createScreen(.savedPredictions)
                .tabItem {
                    Label("Home", systemImage: "house")
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
