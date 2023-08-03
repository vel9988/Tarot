//
//  APICaller.swift
//  Tarot
//
//  Created by Dmitryi Velko on 24.07.2023.
//

import Foundation
import OpenAI

final class APICaller {
    static let shared = APICaller()
    
    let openAI = OpenAI(apiToken: R.API.apiKey)
    let defaultTorolog = R.RoleGPT.torolog
    
    func predictionRequest(question: String, cards: [String]) async -> String {
        
        let query = ChatQuery(model: .gpt3_5Turbo,
                              messages: [.init(role: .user, content: "\(defaultTorolog) Вопрос:\(question), Карты:\(cards)")],
                              temperature: 0.6,
                              topP: 0.7,
//                              maxTokens: 50,
                              presencePenalty: 1.2,
                              frequencyPenalty: 0.6)
        do {
            let result = try await openAI.chats(query: query)
            print("CORRECT!!")
            print(result)
            if let result = result.choices[0].message.content {
                return result
            } else {
                return ""
            }
        } catch {
            print("error")
            return "Sorry something went wrong"
        }
    }
    
}
