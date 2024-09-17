//
//  ChatGPTMessage.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 17/09/2024.
//

import Foundation

struct ChatGPTMessage: Codable {
    let role: ChatGPTRole
    let content: String
}
