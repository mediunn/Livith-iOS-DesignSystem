//
//  LivithDesignSystemTests.swift
//  LivithDesignSystemTests
//
//  Created by Youjin Lee on 1/6/26.
//

import XCTest
@testable import LivithDesignSystem

final class LivithDesignSystemTests: XCTestCase {
    func test_version_isNotEmpty() {
        XCTAssertFalse(LivithDesignSystem.version.isEmpty)
    }
}
