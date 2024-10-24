//
//  MainView.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 21/08/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel: MainViewModel

    init(coordinator: MainCoordinatorProtocol) {
        self._viewModel = .init(wrappedValue: .init(coordinator: coordinator))
    }

    var body: some View {
        VStack {
            Button(action: { viewModel.presentPaywall() }, label: {
                Text("Subscribe")
            })
        }
        .padding()
    }
}
