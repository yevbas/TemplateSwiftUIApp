//
//  Settings+Configuration.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 25/08/2024.
//

import Foundation
import UIKit

extension Configuration {
    struct Settings {
        var strings = Strings()
        var images = Images()
        var constants = Constants()
    }
}

extension Configuration.Settings {
    struct Strings {
        var rateUsTitle = "Rate us"
        var changeLanguageTitle = "Change language"
        var writeMailTitle = "Write mail"
        var privacyPolicyTitle = "Privacy policy"
        var termsOfUseTitle = "Terms and Conditions"
    }
}

extension Configuration.Settings {
    struct Constants {
        var privacyPolicyURL = "google.com"
        var termsOfUseURL = "google.com"
        var mail = "anymail@gmail.com"
    }
}

extension Configuration.Settings {
    struct Images {
        var rateUsIcon = UIImage(systemName: "star")!
        var mailIcon = UIImage(systemName: "envelope")!
        var changeLanguageIcon = UIImage(systemName: "globe")!
        var privacyPolicyIcon = UIImage(systemName: "hand.raised")!
        var termsOfUseIcon = UIImage(systemName: "doc.plaintext")!
    }
}
