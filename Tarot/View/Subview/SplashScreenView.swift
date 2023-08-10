//
//  SplashScreenView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 04.08.2023.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var fontSize = 10.0
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            
            Text("Tarot Magic")
                .font(Font.system(size: fontSize)).bold()
                .foregroundColor(.white)
                .onAppear {
                    withAnimation(.spring(response: 0.9, dampingFraction: 0.5, blendDuration: 1)) {
                        fontSize = 70
                    }
                }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
