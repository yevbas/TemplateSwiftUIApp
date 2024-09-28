//
//  StoreProductView.swift
//  Pidget
//
//  Created by Jackson  on 23/09/2024.
//

import SwiftUI
import RevenueCat
import Resolver

struct StoreProductView: View {
    @Injected private var configuration: Paywall

    let product: StoreProduct
    let isSelected: Bool

    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "checkmark.circle")
                    .foregroundStyle(isSelected ? Color.green.gradient : Color.gray.gradient)
                    .font(.title.weight(.light))
                VStack(alignment: .leading) {
                    HStack {
                        Text(product.localizedPriceString + " /")
                        Text(product.localizedTitle)
                    }
                    if let localizedPricePerYear = product.localizedPricePerYear, product.subscriptionPeriod?.unit != .year {
                        HStack {
                            Text(localizedPricePerYear + " /")
                            Text(configuration.strings.annuallyTitle)
                        }
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(Color.secondary)
                    }
                }
                Spacer()
            }
            .font(.headline.weight(.bold))
            .foregroundStyle(Color.black)
        }
    }
}
