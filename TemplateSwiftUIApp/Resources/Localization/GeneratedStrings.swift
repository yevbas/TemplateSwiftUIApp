// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum S {
  public enum Main {
    /// Main
    public static let title = S.tr("Localizable", "main.title", fallback: "Main")
  }
  public enum Settings {
    /// Change language
    public static let changeLanguageTitle = S.tr("Localizable", "settings.change_language_title", fallback: "Change language")
    /// Privacy policy
    public static let privacyPolicyTitle = S.tr("Localizable", "settings.privacy_policy_title", fallback: "Privacy policy")
    /// Rate us
    public static let rateUsTitle = S.tr("Localizable", "settings.rate_us_title", fallback: "Rate us")
    /// Terms and conditions
    public static let termsOfUseTitle = S.tr("Localizable", "settings.terms_of_use_title", fallback: "Terms and conditions")
    /// Settings
    public static let title = S.tr("Localizable", "settings.title", fallback: "Settings")
    /// Write mail
    public static let writeMailTitle = S.tr("Localizable", "settings.write_mail_title", fallback: "Write mail")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension S {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
