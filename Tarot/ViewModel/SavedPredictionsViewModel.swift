//
//  SavedPredictionsViewModel.swift
//  Tarot
//
//  Created by Dmitryi Velko on 27.07.2023.
//

import Foundation
import RealmSwift

final class SavedPredictionsViewModel: ObservableObject {
    
    @ObservedResults(Prediction.self) var predictionLists
    
    func deletePrediction(with id: ObjectId) {
        for prediction in predictionLists where prediction.id == id {
            delete(prediction)
            break
        }
    }
    
    //    func deletePrediction(at indexSet: IndexSet) {
    //        guard let index = indexSet.first else { return }
    //        let prediction = predictionLists[index]
    //        delete(prediction)
    //    }
    
    private func delete(_ prediction: ObjectBase) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(prediction)                }
        } catch {
            print("Error deleting prediction: \(error.localizedDescription)")
        }
    }
    
}
