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

        // 예상된 리소스 번들을 찾지 못한 경우: 디버그 빌드에서는 경고를 남겨 설정 문제를 조기에 발견할 수 있도록 한다.
        #if DEBUG
        print("[LivithDesignSystem] 경고: 리소스 번들 '\(bundleName).bundle'을 찾을 수 없습니다. Bundle(for: BundleFinder.self)로 폴백합니다.")
        #endif

        // 프레임워크 빌드 시 해당 클래스를 포함하는 번들로 폴백
        return Bundle(for: BundleFinder.self)
    }()
}
