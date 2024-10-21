//
//  AppDelegate+setup.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 26/08/2024.
//

import Foundation
import Resolver
import RevenueCat

extension AppDelegate {
    func setupMain() {
        Resolver.register { Main() }.scope(.application)
    }

    func setupSettings() {
        Resolver.register { Settings() }.scope(.application)
    }

    func setupPaywall() {
        #warning("TODO: Add purchases apiKey if needed")
        Resolver.register { Paywall() }.scope(.application)

        if let purchasesKey = AppDelegate.getApiKey(for: .purchases) {
            Purchases.logLevel = .debug
            Purchases.configure(withAPIKey: purchasesKey)
            Resolver.register { PurchasesUseInformationMonitor(customerInfoStreaming: Purchases.shared.customerInfoStream) }.scope(.application)
        }
    }
}
