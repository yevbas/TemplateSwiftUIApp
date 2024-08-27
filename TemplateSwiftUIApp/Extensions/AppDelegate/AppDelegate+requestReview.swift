//
//  AppDelegate+requestReview.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 25/08/2024.
//

import Foundation
import StoreKit

extension AppDelegate {
    static func requestReview() {
        guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0 is UIWindowScene } ) as? UIWindowScene else {
            return
        }
        SKStoreReviewController.requestReview(in: windowScene)
    }
}
