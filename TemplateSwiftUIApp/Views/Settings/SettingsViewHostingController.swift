//
//  SettingsViewHostingController.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 24/08/2024.
//

import Foundation
import Resolver

final class SettingsViewHostingController: HostingController<SettingsView> {
    @LazyInjected private var configuration: Settings

    init(coordinator: SettingsCoordinator) {
        super.init(rootView: SettingsView(coordinator: coordinator))
    }

    override func setupNavigationBar() {
        navigationItem.title = configuration.strings.title
    }
}
