//
//  Prediction.swift
//  Tarot
//
//  Created by Dmitryi Velko on 13.07.2023.
//

import Foundation
import RealmSwift

final class Prediction: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var dateCreation: String
    @Persisted var cards: List<String>
    @Persisted var predictionText: String
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
