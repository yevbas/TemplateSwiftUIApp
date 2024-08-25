//
//  SettingsViewModel.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 24/08/2024.
//

import Foundation
import Resolver

final class SettingsViewModel: ObservableObject {
    @LazyInjected private var configuration: Configuration.Settings

    private weak var coordinator: SettingsCoordinator?

    init(coordinator: SettingsCoordinator?) {
        self.coordinator = coordinator
    }

    func presentMailCompose() {
        coordinator?.presentMailCompose(recipients: [configuration.constants.mail])
    }

    func presentRateUs() {
        AppDelegate.requestReview()
    }
}
