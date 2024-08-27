//
//  DesignSystem.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 26/08/2024.
//

import Foundation

let ds = DesignSystem.shared

struct DesignSystem {
    static let shared = DesignSystem()

    var spacing: Spacing = .init()
    var corners: Corners = .init()
    var sizer: Sizer = .init()

    struct Sizer {
        /// 4.0
        var xxs = 4.0
        /// 8.0
        var xs = 8.0
        /// 12.0
        var sm = 12.0
        /// 16.0
        var md = 16.0
        /// 24.0
        var xl = 28.0
        /// 32.0
        var xxl = 34.0
        /// 48.0
        var xxxl = 48.0
    }

    struct Spacing {
        /// 4.0
        var xxs = 4.0
        /// 8.0
        var xs = 8.0
        /// 12.0
        var sm = 12.0
        /// 16.0
        var md = 16.0
        /// 24.0
        var xl = 24.0
        /// 32.0
        var xxl = 32.0
        /// 48.0
        var xxxl = 48.0
    }

    struct Corners {
        /// 4.0
        var xs = 4.0
        /// 8.0
        var sm = 8.0
        /// 10.0
        var md = 10.0
        /// 12.0
        var xl = 12.0
        /// 24.0
        var xxl = 24.0
    }

}


