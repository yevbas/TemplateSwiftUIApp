//
//  PurchasesUseInformationMonitor.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 26/08/2024.
//

import SwiftUI
import RevenueCat

/// Delegates asynchronous customer information flow from RevenueCat.
@MainActor
final class PurchasesUseInformationMonitor: ObservableObject {
    @Published var customerInfo: CustomerInfo?

    var userHasFullAccess: Bool {
        customerInfo?.userHasFullAccess ?? false
    }

    let streaming: AsyncStream<CustomerInfo>

    init(customerInfoStreaming: AsyncStream<CustomerInfo>) {
        self.streaming = customerInfoStreaming
        Task {
            for await lastPiece in self.streaming {
                DispatchQueue.main.async { [weak self] in
                    self?.customerInfo = lastPiece
                }
            }
        }
    }
}

extension CustomerInfo {
    var userHasFullAccess: Bool {
        entitlements["full_access_entitlement"]?.isActive ?? false
    }
}

