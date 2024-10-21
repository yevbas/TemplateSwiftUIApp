//
//  SettingsView.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 24/08/2024.
//

import SwiftUI
import Resolver

struct SettingsView: View {
    @Injected private var configuration: Settings
    @StateObject private var viewModel: SettingsViewModel

    init(coordinator: SettingsCoordinatorProtocol) {
        self._viewModel = .init(wrappedValue: .init(coordinator: coordinator))
    }

    var body: some View {
        List {
            Button(action: {
                viewModel.presentRateUs()
            }, label: {
                HStack {
                    configuration.images.rateUsIcon.image
                    Text(configuration.strings.rateUsTitle)
                }
            })
            Button(action: {
                viewModel.presentMailCompose()
            }, label: {
                HStack {
                    configuration.images.mailIcon.image
                    Text(configuration.strings.writeMailTitle)
                }
            })
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                Link(destination: settingsURL) {
                    HStack {
                        configuration.images.changeLanguageIcon.image
                        Text(configuration.strings.changeLanguageTitle)
                    }
                }
            }
            if let privacyPolicyURL = URL(string: configuration.constants.privacyPolicyURL) {
                Link(destination: privacyPolicyURL) {
                    HStack {
                        configuration.images.privacyPolicyIcon.image
                        Text(configuration.strings.privacyPolicyTitle)
                    }
                }
            }
            if let termsOfUseURL = URL(string: configuration.constants.privacyPolicyURL) {
                Link(destination: termsOfUseURL) {
                    HStack {
                        configuration.images.termsOfUseIcon.image
                        Text(configuration.strings.termsOfUseTitle)
                    }
                }
            }
        }
    }

}
