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
            // 패키지가 앱에 연결되어 있을 때 번들 위치
            Bundle.main.resourceURL,
            // 패키지가 프레임워크에 연결되어 있을 때 번들 위치
            Bundle(for: BundleFinder.self).resourceURL,
            // 커맨드라인 도구용 번들 위치
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }

        // 프레임워크 빌드 시 해당 클래스를 포함하는 번들로 폴백
        return Bundle(for: BundleFinder.self)
    }()
}
