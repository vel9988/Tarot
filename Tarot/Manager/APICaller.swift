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
    
    func predictionRequest(content: String, cards: [String]) async -> String {
        let queryOne = ChatQuery(model: .gpt3_5Turbo,
                                 messages: [.init(role: .user, content: "\(defaultTorolog) \(cards)" + content)])
        do {
            let result = try await openAI.chats(query: queryOne)
            print("Correct")
            if let result = result.choices[0].message.content {
                return result
            } else {
                return ""
            }
        } catch {
            print("error")
            return ""
        }
    }
    
}
