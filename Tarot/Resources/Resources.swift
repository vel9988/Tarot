//
//  Resources.swift
//  Tarot
//
//  Created by Dmitryi Velko on 22.07.2023.
//

import SwiftUI

typealias R = Resources

enum Resources {
    
    enum ColorApp {
        static let glowColor = Color("glowColor")
    }
    
    enum API {
        static let apiKey = "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"
    }
    
    enum RoleGPT {
        static let torolog = "Представь что ты великий таролог, который раскладывает таро уже боле тысячи лет. Вот мой вопрос и карты. Сделай расклад как профессиональный торолог"
    }
}
