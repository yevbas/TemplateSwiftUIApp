//
//  AppDelegate+apiKey.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 26/08/2024.
//

import Foundation

enum ApiKey: String {
    case purchases = "REVENUE_CAT"
}

extension AppDelegate {
    /// Gets api keys from Info.plist file
    /// - Parameter key: key for value
    /// - Returns: value under key
    static func getApiKey(for key: ApiKey) -> String? {
        guard let envDict = Bundle.main.infoDictionary?["LSEnvironment"] as? Dictionary<String, String>,
              let envStr = envDict[key.rawValue] else {
            return nil
        }
        return envStr
    }
}
