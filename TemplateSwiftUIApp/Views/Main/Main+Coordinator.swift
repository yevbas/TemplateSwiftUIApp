//
//  Main+Coordinator.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 24/08/2024.
//

import UIKit

final class MainCoordinator: Coordinator {
    weak var navigationController: UINavigationController?

    private weak var window: UIWindow?

    init(window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MainViewHostingController(coordinator: self)
        navigationController?.viewControllers = [viewController]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func navigateToSettings() {
        let coordinator = SettingsCoordinator(
            navigationController: navigationController
        )
        coordinator.start()
    }

    func presentPaywall() {
        let coordinator = PaywallCoordinator(
            navigationController: navigationController
        )
        coordinator.start()
    }
}
