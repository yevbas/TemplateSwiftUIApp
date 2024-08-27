//
//  PaywallViewModel.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 26/08/2024.
//

import Foundation
import RevenueCat
import Resolver

@MainActor
final class PaywallViewModel: ObservableObject {
    @LazyInjected private var configuration: Paywall
    @Published private(set) var products: [StoreProduct] = []
    @Published private(set) var purchaseProcessing = false

    private weak var coordinator: PaywallCoordinator?

    private let purchases = Purchases.shared

    private var productId: String {
        configuration.constants.productId
    }

    init(coordinator: PaywallCoordinator) {
        self.coordinator = coordinator
    }

    func loadProducts() async {
//         products = await purchases.products([productId])
        products = [.init(sk1Product: .init())]
    }

    func restore() {
        purchaseProcessing = true
        purchases.restorePurchases { [weak self] userInfo, _ in
            self?.purchaseProcessing = false

            if let userInfo, userInfo.userHasFullAccess {
                self?.coordinator?.dismiss()
            }
        }
    }

    func purchase() {
        guard let allAccess = products.first(where: { $0.productIdentifier == productId }) else {
            return
        }
        purchaseProcessing = true
        purchases.purchase(product: allAccess) { [weak self] transaction, userInfo, _, _ in
            self?.purchaseProcessing = false

            if transaction != nil && userInfo != nil {
                self?.coordinator?.dismiss()
            }
        }
    }
}
