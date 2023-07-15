//
//  CardView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 14.07.2023.
//

import SwiftUI

struct CardView: View {
    
    let cardName: String

    @State private var isSelected: Bool = false
    
    var body: some View {
        Image(cardName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .rotation3DEffect(Angle(degrees: isSelected ? Double.random(in: 5...15) : 0),
                              axis: (x: CGFloat.random(in: 4...10),
                                     y: CGFloat.random(in: 4...10),
                                     z: CGFloat.random(in: 4...10)))
            .scaleEffect(isSelected ? 1.0 : 0.9)
            .animation(Animation.spring(response: 0.4, dampingFraction: 0.2, blendDuration: 1),
                       value: isSelected)
            .onTapGesture {
                self.isSelected.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.isSelected.toggle()
                }
            }
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardName: "testCard")
    }
}
