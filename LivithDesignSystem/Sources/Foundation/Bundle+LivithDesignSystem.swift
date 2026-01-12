//
//  Bundle+LivithDesignSystem.swift
//  LivithDesignSystem
//
//  Created by Youjin Lee on 1/12/26.
//  Copyright © 2026 Livith. All rights reserved.
//

import Foundation

private class BundleFinder {}

public extension Bundle {
    /// LivithDesignSystem 리소스 번들
    static let livithDesignSystem: Bundle = {
        let bundleName = "LivithDesignSystem_LivithDesignSystem"

        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,
            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: BundleFinder.self).resourceURL,
            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }

        // Fallback to the bundle containing this class (for framework builds)
        return Bundle(for: BundleFinder.self)
    }()
}
