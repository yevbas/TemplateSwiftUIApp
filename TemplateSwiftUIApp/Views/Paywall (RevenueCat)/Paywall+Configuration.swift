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
        var restorePurchasesButton = "Restore"
        var privacyPolicyTitle = "Privacy policy"
        var doneButton = "Done"
        var availablePlans = "Available plans:"
        var noProductsTitle = "No products found"
        var termsOfUseTitle = "Terms and Conditions"
        var cancelAnytimeTitle = "Cancel any time"
        var continueButton = "Continue"
        var annuallyTitle = "Annually"
    }
}

extension Paywall {
    struct Constants {
        var privacyPolicyURL = "google.com"
        var termsOfUseURL = "google.com"
        #warning("TODO: Add product id if needed")
        var storeProductIds = [
            "-your-product-id-"
        ]
    }
}
