//
//  MainView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 14.07.2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var viewModel: MainViewModel
    
    @State var text: String = ""
    @State var isEditing: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                VStack {
                    HStack {
                        Spacer()
                        Text("\(text.count) / 150")
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    TextField("What do you want to know about?", text: $text, axis: .vertical)
                        .font(.title3)
                        .foregroundColor(.black)
                        .textFieldStyle(.roundedBorder)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(color: Color(.white), radius: isEditing ? 20 : 10, x: 0, y: 0)
                                .animation(Animation.spring(), value: isEditing)
                        }
                        .onChange(of: text) { newText in
                            isEditing = !newText.isEmpty
                            if newText.count > 150 {
                                text = String(newText.prefix(150))
                            }
                        }
                        .padding(.horizontal)
                }
                
                Spacer()
                
                Button("Tarot magic") {
                    let randomCards = viewModel.randomCards()
                    Task {
                        let predictionRequest = await APICaller.shared.predictionRequest(content: text,
                                                      cards: randomCards)
                        let prediction = viewModel.createPrediction(cards: randomCards,
                                                                    predictionText: predictionRequest )
                        coordinator.prediction = prediction
                        coordinator.present(fullScreenCover: .prediction)
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
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
