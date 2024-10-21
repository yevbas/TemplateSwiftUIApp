//
//  MainViewHostingController.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 24/08/2024.
//

import UIKit
import SwiftUI
import Resolver

final class MainViewHostingController: HostingController<MainView> {
    @LazyInjected private var configuration: Main
    private weak var coordinator: MainCoordinatorProtocol?

    init(coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(rootView: MainView(coordinator: coordinator))
    }

    override func setupNavigationBar() {
        navigationItem.title = configuration.strings.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItems = [
            .init(
                image: .init(systemName: "gear"),
                primaryAction: .init(handler: { [weak self] _ in
                    self?.coordinator?.navigateToSettings()
                })
            )
        ]
    }

}
