//
//  SettingsCoordinator.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 25/08/2024.
//

import UIKit
import SwiftUI

final class SettingsCoordinator: Coordinator {
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = SettingsViewHostingController(coordinator: self)

        navigationController?.pushViewController(viewController, animated: true)
    }

    func presentMailCompose(recipients: [String]) {
        let viewController = UIHostingController(
            rootView: MailView(recipients: recipients)
        )
        navigationController?.present(viewController, animated: true)
    }
}
