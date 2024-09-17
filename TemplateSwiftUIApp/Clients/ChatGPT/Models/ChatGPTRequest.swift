//
//  ChatGPTRequest.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 17/09/2024.
//

import Foundation

struct ChatGPTRequest: Codable {
    let model: String
    let messages: [ChatGPTMessage]
    let max_tokens: Int?
    let temperature: Double?
}
