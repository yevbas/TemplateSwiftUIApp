//
//  HostingController.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 24/08/2024.
//

import UIKit
import SwiftUI

class HostingController<HostingView: View>: UIHostingController<HostingView> {
    override init(rootView: HostingView) {
        super.init(rootView: rootView)
    }

    @available(*, unavailable)
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }

    func setupNavigationBar() {}
}
