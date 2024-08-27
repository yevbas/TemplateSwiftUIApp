//
//  PaywallHostingController.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 26/08/2024.
//

import Foundation

final class PaywallHostingController: HostingController<PaywallView> {
    init(coordinator: PaywallCoordinator) {
        super.init(rootView: PaywallView(coordinator: coordinator))
    }
}
