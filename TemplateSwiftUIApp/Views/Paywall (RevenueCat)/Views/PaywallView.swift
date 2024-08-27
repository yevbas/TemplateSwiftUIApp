//
//  PaywallView.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 26/08/2024.
//

import SwiftUI
import Resolver

struct PaywallView: View {
    @Injected private var configuration: Paywall
    @StateObject private var viewModel: PaywallViewModel

    init(coordinator: PaywallCoordinator) {
        self._viewModel = .init(wrappedValue: .init(coordinator: coordinator))
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.gray, .white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            if viewModel.products.isEmpty || viewModel.purchaseProcessing {
                ProgressView()
                    .task { await viewModel.loadProducts() }
            } else {
                ScrollView {
                    VStack {
                        VStack(spacing: ds.spacing.xs) {
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 104))
                                .foregroundStyle(Color.white)
                            Text("-PAYWALL VIEW-")
                                .font(.largeTitle.weight(.black))
                                .foregroundStyle(Color.white)
                        }
                        .padding(.top, 64)
                        //                        VStack(spacing: ds.spacing.md) {
                        //                            Group {
                        //                                SubscriptionFeatureView(
                        //                                    title: s.feature1Title,
                        //                                    description: s.feature1Subtitle,
                        //                                    systemImage: "infinity"
                        //                                )
                        //                                Divider()
                        //                                SubscriptionFeatureView(
                        //                                    title: s.feature2Title,
                        //                                    description: s.feature2Subtitle,
                        //                                    systemImage: "theatermask.and.paintbrush"
                        //                                )
                        //                                Divider()
                        //                                SubscriptionFeatureView(
                        //                                    title: s.feature3Title,
                        //                                    description: s.feature3Subtitle,
                        //                                    systemImage: "bell"
                        //                                )
                        //                            }
                        //                            .frame(maxWidth: .infinity, alignment: .leading)
                        //                            .multilineTextAlignment(.leading)
                        //                            .font(.title2)
                        //                        }
                        //                        .padding()
                        //                        .background {
                        //                            RoundedRectangle(cornerRadius: ds.corners.xxl)
                        //                                .fill(Material.ultraThinMaterial)
                        //                        }
                        //                        .padding(.horizontal, ds.spacing.md)
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    if viewModel.products.first(where: { $0.productIdentifier == configuration.constants.productId }) != nil  {
                        VStack(spacing: ds.spacing.md) {
                            Button(
                                action: { viewModel.purchase() },
                                label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: ds.corners.xxl)
                                            .fill(.black)
                                        Text("-CONTINUE-")
                                            .foregroundStyle(Color.white)
                                            .font(.headline.weight(.bold))
                                    }
                                }
                            )
                            .frame(maxHeight: 56)

                            Button(
                                configuration.strings.restorePurchasesButton,
                                action: {
                                    viewModel.restore()
                                }
                            )
                            .font(.subheadline.weight(.semibold))

                            HStack {
                                Spacer()
                                if let privacyPolicyURL = URL(string: configuration.constants.privacyPolicyURL) {
                                    Link(configuration.strings.privacyPolicyTitle, destination: privacyPolicyURL)
                                }
                                if let termsOfUseURL = URL(string: configuration.constants.termsOfUseURL) {
                                    Link(configuration.strings.termsOfUseTitle, destination: termsOfUseURL)
                                }
                            }
                            .font(.subheadline)
                            .foregroundStyle(Color.black)
                        }
                        .padding(.horizontal, ds.spacing.md)
                    }
                }
            }
        }
        .interactiveDismissDisabled(viewModel.purchaseProcessing)
    }

}
