//
//  MainViewModel.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 25/08/2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    private weak var coordinator: MainCoordinatorProtocol?

    init(coordinator: MainCoordinatorProtocol?) {
        self.coordinator = coordinator
    }

    func presentPaywall() {
        coordinator?.presentPaywall()
    }
}
