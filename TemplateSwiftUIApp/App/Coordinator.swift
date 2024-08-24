//
//  Coordinator.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 24/08/2024.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get }

    func start()
}
