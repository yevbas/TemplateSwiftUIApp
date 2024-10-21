//
//  PaywallView.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 26/08/2024.
//

import SwiftUI
import RevenueCat
import Resolver

struct PaywallView: View {
    @Injected private var configuration: Paywall
    @StateObject private var viewModel: PaywallViewModel

    init(coordinator: PaywallCoordinatorProtocol) {
        self._viewModel = .init(wrappedValue: .init(coordinator: coordinator))
    }

    var body: some View {
        ZStack {
            backgroundView
            switch viewModel.state {
            case .idle, .empty:
                Button(configuration.strings.noProductsTitle) {
                    viewModel.dismiss()
                }
            case .loaded(let products, let selectedProduct):
                mainView(
                    products: products,
                    selectedProduct: selectedProduct
                )
            case .loading:
                ProgressView()
                    .tint(.blue)
            }
        }
        .animation(.default, value: viewModel.state)
        .preferredColorScheme(.light)
        .task { await viewModel.loadProducts() }
        .interactiveDismissDisabled(viewModel.state == .loading)
    }

    private func mainView(
        products: [StoreProduct],
        selectedProduct: StoreProduct
    ) -> some View {
        VStack(spacing: ds.spacing.md) {
            headerView(selectedProduct: selectedProduct)
            productsView(
                products: products,
                selectedProduct: selectedProduct
            )
            bottomView(selectedProduct: selectedProduct)
        }
    }

    private func productsView(
        products: [StoreProduct],
        selectedProduct: StoreProduct
    ) -> some View {
        VStack {
            Text(configuration.strings.availablePlans)
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(showsIndicators: false) {
                VStack(spacing: ds.spacing.sm) {
                    ForEach(products, id: \.productIdentifier) { product in
                        StoreProductView(
                            product: product,
                            isSelected: selectedProduct == product
                        )
                        .onTapGesture {
                            viewModel.state = .loaded(products, selectedProduct: product)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, ds.spacing.md)
    }

    private func headerView(selectedProduct: StoreProduct) -> some View {
        VStack(spacing: ds.spacing.md) {
            toolbarView
            Text("⭐️ " + selectedProduct.localizedDescription)
                .font(.title.weight(.bold))
                .foregroundStyle(Color.black)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
            featuresView
        }
        .foregroundStyle(Color.secondary)
        .padding(.top, ds.spacing.xl)
        .padding(.horizontal, ds.spacing.md)
    }

    private func continueButton(selectedProduct: StoreProduct) -> some View {
        Button(
            action: {
                viewModel.purchase()
            }, label: {
                VStack(spacing: ds.spacing.xxs) {
                    Text(configuration.strings.continueButton)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.white)
                        .font(.title2.weight(.bold))
                    if selectedProduct.subscriptionPeriod != nil {
                        Text(configuration.strings.cancelAnytimeTitle)
                            .foregroundStyle(Color.white)
                            .font(.footnote.weight(.medium))
                    }
                }
                .frame(minHeight: 46)
                .padding(.vertical, ds.spacing.xs)
                .background {
                    RoundedRectangle(cornerRadius: 32)
                        .fill(Color.green.gradient)
                }
            }
        )
        .padding(.horizontal, ds.spacing.xl)
    }

    private var featuresView: some View {
        VStack(spacing: ds.spacing.md) {
            VStack(spacing: ds.spacing.md) {
                ForEach(viewModel.features, id: \.title) {
                    makeFeatureTitle(
                        image: $0.systemImage,
                        title: $0.title
                    )
                }
            }
        }
        .foregroundStyle(Color.white)
        .font(.headline)
        .padding(.vertical, ds.spacing.md)
        .padding(.horizontal, ds.spacing.xl)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue.gradient)
        }
    }

    private var restorePurchasesButton: some View {
        Button(configuration.strings.restorePurchasesButton, action: {
            viewModel.restore()
        })
        .foregroundStyle(Color.pink)
    }

    private var toolbarView: some View {
        HStack(spacing: ds.spacing.md) {
            restorePurchasesButton
            Spacer()
            Button(action: {
                if viewModel.state != .loading {
                    viewModel.dismiss()
                }
            }, label: {
                Text(configuration.strings.doneButton)
                    .foregroundStyle(Color.blue)
            })
        }
    }

    private var linksView: some View {
        HStack {
            if let privacyPolicyURL = URL(string: configuration.constants.privacyPolicyURL) {
                Link(configuration.strings.privacyPolicyTitle, destination: privacyPolicyURL)
            }
            if let privacyPolicyURL = URL(string: configuration.constants.termsOfUseURL) {
                Link(configuration.strings.termsOfUseTitle, destination: privacyPolicyURL)
            }
        }
        .font(.footnote.weight(.medium))
        .foregroundStyle(Color.gray)
    }

    private func bottomView(selectedProduct: StoreProduct) -> some View {
        VStack(spacing: ds.spacing.xs) {
            continueButton(selectedProduct: selectedProduct)
            linksView
        }
        .padding(.horizontal, ds.spacing.md)
    }

    private var backgroundView: some View {
        Rectangle()
            .fill(Color.white)
            .ignoresSafeArea()
    }

    func makeFeatureTitle(
        image systemName: String,
        title: String
    ) -> some View {
        HStack {
            Image(systemName: systemName)
            Text(title)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .multilineTextAlignment(.center)
                .lineLimit(1)
        }
    }

}
