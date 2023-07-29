//
//  PredictionDetails.swift
//  Tarot
//
//  Created by Dmitryi Velko on 26.07.2023.
//

import Foundation

struct PredictionDetails: Identifiable {
    var id = UUID()
    var name: String
    var date: String
    var image: String
}
