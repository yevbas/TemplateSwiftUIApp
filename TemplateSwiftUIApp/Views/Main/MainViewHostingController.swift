//
//  MainViewHostingController.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 24/08/2024.
//

import UIKit
import SwiftUI

final class MainViewHostingController: HostingController<MainView> {
    private weak var coordinator: MainCoordinator?

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        super.init(rootView: MainView(coordinator: coordinator))
    }

    override func setupNavigationBar() {
        navigationItem.title = "Main screen title"
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
