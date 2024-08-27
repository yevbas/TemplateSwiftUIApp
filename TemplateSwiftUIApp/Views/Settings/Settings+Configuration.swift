//
//  Settings+Configuration.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 25/08/2024.
//

import Foundation
import UIKit

struct Settings {
    var strings = Strings()
    var images = Images()
    var constants = Constants()
}

extension Settings {
    struct Strings {
        var title = S.Settings.title
        var rateUsTitle = S.Settings.rateUsTitle
        var changeLanguageTitle = S.Settings.changeLanguageTitle
        var writeMailTitle = S.Settings.writeMailTitle
        var privacyPolicyTitle = S.Settings.privacyPolicyTitle
        var termsOfUseTitle = S.Settings.termsOfUseTitle
    }
}

extension Settings {
    struct Constants {
        var privacyPolicyURL = "google.com"
        var termsOfUseURL = "google.com"
        var mail = "anymail@gmail.com"
    }
}

extension Settings {
    struct Images {
        var rateUsIcon = UIImage(systemName: "star")!
        var mailIcon = UIImage(systemName: "envelope")!
        var changeLanguageIcon = UIImage(systemName: "globe")!
        var privacyPolicyIcon = UIImage(systemName: "hand.raised")!
        var termsOfUseIcon = UIImage(systemName: "doc.plaintext")!
    }
}
