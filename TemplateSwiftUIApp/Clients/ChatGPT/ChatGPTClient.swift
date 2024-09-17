//
//  ChatGPTClient.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 17/09/2024.
//

import Foundation
import Combine

protocol ChatGPTClientProtocol {
    func sendMessage(
        messages: [ChatGPTMessage],
        model: ChatGPTModel,
        maxTokens: Int?,
        temperature: Double?
    ) async throws -> ChatGPTResponse
}

// Example of usage:
//   do {
//       let answer = try await client.sendMessage(
//           messages: [.init(role: .user, content: "Hello, how are you?")]
//       )
//       print(answer)
//   } catch {
//       print(error)
//   }
final class ChatGPTClient: ChatGPTClientProtocol {

    private let apiKey: String

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    func sendMessage(
        messages: [ChatGPTMessage],
        model: ChatGPTModel = .gpt3_5Turbo,
        maxTokens: Int? = 1000,
        temperature: Double? = 0.7
    ) async throws -> ChatGPTResponse {
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let requestBody = ChatGPTRequest(
            model: model.rawValue,
            messages: messages,
            max_tokens: maxTokens,
            temperature: temperature
        )
        do {
            let jsonData = try JSONEncoder().encode(requestBody)
            request.httpBody = jsonData
        } catch {
            throw ChatGPTError.apiError("Failed to encode the request")
        }
        let response = try await URLSession.shared.data(for: request)

        return try JSONDecoder().decode(ChatGPTResponse.self, from: response.0)
    }
}
