//
//  RealmManager.swift
//  Tarot
//
//  Created by Dmitryi Velko on 28.07.2023.
//

import Foundation
import RealmSwift

final class RealmManager {
    static let shared = RealmManager()
    
    @ObservedResults(Prediction.self) var predictionLists
    
    func savePrediction(name: String, cards: [String], predictionText: String, dateCreation: String) {
        
        let prediction = Prediction()
        prediction.name = name
        prediction.cards.append(objectsIn: cards)
        prediction.predictionText = predictionText
        prediction.dateCreation = dateCreation
        
        $predictionLists.append(prediction)
        
    }
    
}
