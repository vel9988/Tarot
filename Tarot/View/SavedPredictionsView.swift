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
            List {
                ForEach(predictionLists, id: \.id) { prediction in
                    NavigationLink {
                        let predictionVM = PredictionViewModel(name: prediction.name,
                                                               cards: Array(prediction.cards),
                                                               predictionText: prediction.predictionText)
                        PredictionView(viewModel: predictionVM, isSaved: true)
                    } label: {
                        HStack {
                            PredictionCellView(predictionDetail: prediction)
                        }
                    }
                }
                .onDelete { index in
                    viewModel.deletePrediction(at: index)
                }
                
            }
            .listStyle(.plain)
            .background(Image("Background"))
            .padding(10)
            
        }
    }
    
}

struct SavedPredictionsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedPredictionsView(viewModel: SavedPredictionsViewModel())
    }
}
