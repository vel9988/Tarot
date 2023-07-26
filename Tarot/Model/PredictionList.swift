//
//  PredictionList.swift
//  Tarot
//
//  Created by Dmitryi Velko on 20.07.2023.
//

import Foundation
import RealmSwift

final class PredictionList: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var predictionList: List<Prediction>
    
}
