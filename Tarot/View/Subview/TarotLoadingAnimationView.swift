//
//  TarotLoadingAnimationView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 05.08.2023.
//

import SwiftUI

struct TarotLoadingAnimationView: View {
    @State private var rotation: Double = 0.0
    @State private var scale: CGFloat = 1.0
    
    let animationDuration: Double = 2.0
    
    var body: some View {
        VStack {
            LottieView()
                .frame(width: 250, height: 250)
            
            Text("Searching for magic...")
                .foregroundColor(.white)
                .font(.headline)
                .padding(.top, 10)
        }
        .onAppear {
            self.rotation = 360.0
            self.scale = 1.5
        }
    }
}

struct TarotLoadingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TarotLoadingAnimationView()
            .background(Color.black)
    }
}
