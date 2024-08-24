//
//  MainViewHostingController.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 24/08/2024.
//

import UIKit
import SwiftUI

final class MainViewHostingController: HostingController<MainView> {
    init() {
        super.init(rootView: MainView())
    }
}
