//
//  ChatGPTResponse.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 17/09/2024.
//

import Foundation

struct ChatGPTResponse: Codable {
    struct Choice: Codable {
        let message: ChatGPTMessage
    }
    let choices: [Choice]
}
