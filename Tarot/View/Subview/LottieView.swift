//
//  LottieView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 14.08.2023.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let lottieFile: String = "animation"
    
    let animationView = LottieAnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
