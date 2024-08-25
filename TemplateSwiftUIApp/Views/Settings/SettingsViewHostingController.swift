//
//  SettingsViewHostingController.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 24/08/2024.
//

import Foundation

final class SettingsViewHostingController: HostingController<SettingsView> {
    init(coordinator: SettingsCoordinator) {
        super.init(rootView: SettingsView(coordinator: coordinator))
    }

    override func setupNavigationBar() {
        navigationItem.title = "Settings screen title"
    }
}
