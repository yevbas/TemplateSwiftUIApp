//
//  ChatGPTError.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 17/09/2024.
//

import Foundation

enum ChatGPTError: Error, LocalizedError {
    case invalidResponse
    case apiError(String)
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response from the server."
        case .apiError(let message):
            return message
        case .decodingError:
            return "Failed to decode the response."
        }
    }
}
