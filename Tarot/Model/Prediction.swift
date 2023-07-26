//
//  Prediction.swift
//  Tarot
//
//  Created by Dmitryi Velko on 13.07.2023.
//

import Foundation
import RealmSwift

final class Prediction: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String?
    @Persisted var dateCreation: Date?
    @Persisted var cards: List<String>
    @Persisted var predictionText: String
    
}
