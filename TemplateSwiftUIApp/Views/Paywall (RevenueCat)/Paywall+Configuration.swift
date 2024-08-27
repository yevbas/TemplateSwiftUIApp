//
//  Paywall+Configuration.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 26/08/2024.
//

import Foundation
import RevenueCat
import Resolver

struct Paywall {
    var strings = Strings()
    var constants = Constants()
}

extension Paywall {
    struct Strings {
        var restorePurchasesButton = "Restore purchases"
        var privacyPolicyTitle = "Privacy policy"
        var termsOfUseTitle = "Terms and Conditions"
    }
}

extension Paywall {
    struct Constants {
        var privacyPolicyURL = "google.com"
        var termsOfUseURL = "google.com"
        #warning("TODO: Add product id if needed")
        var productId = "-your-product-id-"
    }
}