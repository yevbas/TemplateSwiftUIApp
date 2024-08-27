//
//  AppDelegate.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 23/08/2024.
//

import UIKit
import Resolver
import RevenueCat

@main
class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        setupMain()
        setupSettings()
        setupPaywall()

        return true
    }

}
