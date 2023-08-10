//
//  LoadingView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 08.08.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            glassMorphic()
                .ignoresSafeArea(.all)
                .opacity(0.9)
            
            TarotLoadingAnimationView()
            
        }
        
    }
    
    @ViewBuilder
    func glassMorphic() -> some View {
        ZStack {
            CustomBlurView(effect: .systemUltraThinMaterialDark)
        }
    }
    
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

// MARK: - Custom Blur View
struct CustomBlurView: UIViewRepresentable {
    typealias UIViewType = UIVisualEffectView
    
    var effect: UIBlurEffect.Style
//    var onChange: (UIVisualEffectView) -> Void

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: effect))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
//        DispatchQueue.main.async {
//            onChange(uiView)
//        }
    }
}
