//
//  SceneDelegate.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 24/08/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private var navigationController: UINavigationController?
    private var mainCoordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        navigationController = UINavigationController()
        mainCoordinator = MainCoordinator(
            window: window,
            navigationController: navigationController
        )

        mainCoordinator?.start()
    }
}
