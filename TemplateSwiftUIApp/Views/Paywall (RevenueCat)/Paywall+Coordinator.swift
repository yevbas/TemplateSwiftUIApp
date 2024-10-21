//
//  Paywall+Coordinator.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 26/08/2024.
//

import UIKit

protocol PaywallCoordinatorProtocol: Coordinator {
    func dismiss()
}

final class PaywallCoordinator: PaywallCoordinatorProtocol {
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = PaywallHostingController(coordinator: self)

        navigationController?.topViewController?.present(viewController, animated: true)
    }

    func dismiss() {
        navigationController?.dismiss(animated: true)
    }
}
