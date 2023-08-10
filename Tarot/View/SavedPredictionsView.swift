//
//  SavedPredictionsView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 17.07.2023.
//

import SwiftUI
import RealmSwift

struct SavedPredictionsView: View {
    
    @ObservedResults(Prediction.self) var predictionLists
    
    @StateObject var viewModel: SavedPredictionsViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(showsIndicators: false) {
                    ForEach(predictionLists, id: \.id) { prediction in
                        HStack {
                            NavigationLink {
                                let predictionVM = PredictionViewModel(name: prediction.name,
                                                                       cards: Array(prediction.cards),
                                                                       predictionText: prediction.predictionText)
                                PredictionView(viewModel: predictionVM, isSaved: true)
                            } label: {
                                PredictionCellView(predictionDetail: prediction)
                            }
                            .contextMenu {
                                Button {
                                    viewModel.deletePrediction(with: prediction.id)
                                } label: {
                                    Text("Delete")
                                }

                            }
                            
                        }
                    }
                    
                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .padding()
            }
            .background(Image("Background").resizable().scaledToFill().ignoresSafeArea())
            
        }
    }
    
}

struct SavedPredictionsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedPredictionsView(viewModel: SavedPredictionsViewModel())
    }
}
