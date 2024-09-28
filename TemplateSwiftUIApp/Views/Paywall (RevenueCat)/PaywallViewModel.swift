//
//  PaywallViewModel.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 26/08/2024.
//

import Foundation
import RevenueCat
import Resolver

enum PaywallViewState: Equatable {
    case idle
    case loaded(_ products: [StoreProduct], selectedProduct: StoreProduct)
    case loading
    case empty
}

final class PaywallViewModel: ObservableObject {
    @Published var state: PaywallViewState = .idle

    private weak var coordinator: PaywallCoordinator?
    private var products: [StoreProduct] = []

    @LazyInjected private var configuration: Paywall

    private(set) lazy var features: [ProductFeature] = [
        /* .init(title: "No ads", systemImage: "minus"), */
    ]

    init(coordinator: PaywallCoordinator) {
        self.coordinator = coordinator
    }

    @MainActor
    func loadProducts() async {
        state = .loading

        let products = await Purchases.shared.products(configuration.constants.storeProductIds).sorted { $0.price < $1.price }

        if products.isEmpty {
            state = .empty
        } else {
            self.products = products

            state = .loaded(products, selectedProduct: products.first(where: { $0.subscriptionPeriod == nil })!)
        }
    }

    func restore() {
        state = .loading

        Purchases.shared.restorePurchases { [weak self] userInfo, publicError in
            guard let self else { return }

            state = .loaded(products, selectedProduct: products[0])

            if let userInfo, userInfo.userHasFullAccess {
                dismiss()
            }
        }
    }

    func purchase() {
        guard case .loaded(_, let selectedProduct) = state else { return }

        state = .loading

        Purchases.shared.purchase(product: selectedProduct) { [weak self] transaction, userInfo, _, _ in
            guard let self else { return }

            state = .loaded(products, selectedProduct: products[0])

            if transaction != nil && userInfo != nil {
                dismiss()
            }
        }
    }

    func dismiss() {
        coordinator?.dismiss()
    }
}

import UIKit

struct ProductFeature {
    let title: String
    let systemImage: String
}
