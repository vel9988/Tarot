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
    
    @State private var isConfirmationPresented = false
    @State private var isActionConfirmed = false
    
    @State var text: String = ""
    @State var isEditing: Bool = false
    @State private var isLoading: Bool = false
    
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
                    TextField("Ask your question", text: $text, axis: .vertical)
                        .font(.title3)
                        .foregroundColor(.primary)
                        .textFieldStyle(.roundedBorder)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(color: Color(ResApp.Color.glowColor), radius: isEditing ? 20 : 10, x: 0, y: 0)
                                .animation(Animation.spring(), value: isEditing)
                        }
                        .colorScheme(.light)
                        .background(Color.white)
                        .onChange(of: text) { newText in
                            isEditing = !newText.isEmpty
                            if newText.count > 150 {
                                text = String(newText.prefix(150))
                            }
                        }
                        .padding(.horizontal)
                }
                
                Spacer()
                
                Button {
                    isConfirmationPresented = true
                } label: {
                    HStack {
                        Image(ResApp.Icons.magicWand)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Tarot magic")
                    }
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(Color(.black))
                .cornerRadius(25)
                .shadow(color: .white, radius: 5, x: 0, y: 0)
                .disabled(isLoading)
                .padding()
                .confirmationDialog("Подтвердите действие",
                                    isPresented: $isConfirmationPresented,
                                    titleVisibility: .visible) {
                    Button("Подтвердить") {
                        isActionConfirmed = true
                        isLoading = true
                    }
                    Button("Отмена", role: .cancel) { }
                }
                                    .onChange(of: isActionConfirmed) { newValue in
                                        if newValue {
                                            let randomCards = viewModel.randomCards()
                                            Task {
                                                let predictionRequest = await APICaller.shared.predictionRequest(question: text, cards: randomCards)
                                                let prediction = viewModel.createPrediction(name: "\(text.prefix(20))",
                                                                                            cards: randomCards,
                                                                                            predictionText: predictionRequest )
                                                coordinator.prediction = prediction
                                                isLoading = false
                                                isActionConfirmed = false
                                                text = ""
                                                coordinator.present(fullScreenCover: .prediction)
                                            }
                                        }
                                    }
            }
            .background(Image("Background").resizable().scaledToFill().ignoresSafeArea(.all))
            
            if isLoading {
                LoadingView()
            }
            
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
