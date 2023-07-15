//
//  MainView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 14.07.2023.
//

import SwiftUI

struct MainView: View {
    
    @State var text: String = ""
    @State var isEditing: Bool = false
    
    var body: some View {
        VStack() {
            
            Spacer()
            
            TextField("What do you want to know about?", text: $text, axis: .vertical)
                .lineLimit(3, reservesSpace: true)
                .font(.title3)
                .foregroundColor(.black)
                .textFieldStyle(.roundedBorder)
                .shadow(color: Color(.systemYellow), radius: isEditing ? 20 : 10, x: 0, y: 0)
                .animation(Animation.spring(), value: isEditing)
                .onChange(of: text) { newText in
                    isEditing = newText.count > 0
                }
                .padding()
            
            Spacer()
            
            Button("Tarot magic") {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    // добавим на экран карты
                }
            }
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(Color(.black))
            .cornerRadius(25)
            .shadow(color: Color(.white), radius: 5, x: 0, y: 0)
            .padding()
        }
        .background(Image("Background"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
