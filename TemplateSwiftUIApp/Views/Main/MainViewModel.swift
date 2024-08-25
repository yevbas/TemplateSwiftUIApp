//
//  MainViewModel.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 25/08/2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    private weak var coordinator: MainCoordinator?

    init(coordinator: MainCoordinator?) {
        self.coordinator = coordinator
    }
}
