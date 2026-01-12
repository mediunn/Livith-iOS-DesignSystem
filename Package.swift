// swift-tools-version: 5.9
//
//  Package.swift
//  Livith-iOS-DesignSystem
//
//  Created by Youjin Lee on 1/6/26.
//

import PackageDescription

let package = Package(
    name: "LivithDesignSystem",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "LivithDesignSystem",
            targets: ["LivithDesignSystem"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.0.0"),
    ],
    targets: [
        .target(
            name: "LivithDesignSystem",
            dependencies: ["Kingfisher"],
            path: "LivithDesignSystem/Sources",
            resources: [
                .process("../Resources")
            ]
        ),
        .testTarget(
            name: "LivithDesignSystemTests",
            dependencies: ["LivithDesignSystem"],
            path: "Tests/LivithDesignSystemTests"
        ),
    ]
)
