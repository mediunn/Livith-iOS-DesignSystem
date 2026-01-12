//
//  Project.swift
//  Livith-iOS-DesignSystem
//
//  Created by Youjin Lee on 1/6/26.
//

import ProjectDescription

// MARK: - Constants

let projectName = "Livith-iOS-DesignSystem"
let organizationName = "Livith"
let baseBundleID = "com.livith.designsystem"
let deploymentTarget: DeploymentTargets = .iOS("17.0")

// MARK: - Project

let project = Project(
    name: projectName,
    organizationName: organizationName,
    targets: [
        // MARK: - LivithDesignSystem Framework (SDK)
        .target(
            name: "LivithDesignSystem",
            destinations: .iOS,
            product: .framework,
            bundleId: "\(baseBundleID)",
            deploymentTargets: deploymentTarget,
            infoPlist: .extendingDefault(
                with: [
                    "UIAppFonts": [
                        "NotoSansKR-Bold.ttf",
                        "NotoSansKR-Medium.ttf",
                        "NotoSansKR-Regular.ttf",
                        "NotoSansKR-SemiBold.ttf"
                    ]
                ]
            ),
            sources: ["LivithDesignSystem/Sources/**"],
            resources: ["LivithDesignSystem/Resources/**"],
            dependencies: [
                .external(name: "Kingfisher")
            ]
        ),

        // MARK: - LivithStorybook App
        .target(
            name: "LivithStorybook",
            destinations: .iOS,
            product: .app,
            bundleId: "\(baseBundleID).storybook",
            deploymentTargets: deploymentTarget,
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                    "CFBundleDisplayName": "Livith Storybook"
                ]
            ),
            sources: ["Storybook/Sources/**"],
            resources: ["Storybook/Resources/**"],
            dependencies: [
                .target(name: "LivithDesignSystem")
            ]
        ),

        // MARK: - LivithDesignSystemTests
        .target(
            name: "LivithDesignSystemTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "\(baseBundleID).tests",
            deploymentTargets: deploymentTarget,
            infoPlist: .default,
            sources: ["Tests/LivithDesignSystemTests/**"],
            dependencies: [
                .target(name: "LivithDesignSystem")
            ]
        ),
    ],
    schemes: [
        .scheme(
            name: "LivithDesignSystem",
            buildAction: .buildAction(targets: ["LivithDesignSystem"]),
            testAction: .targets(["LivithDesignSystemTests"])
        ),
        .scheme(
            name: "LivithStorybook",
            buildAction: .buildAction(targets: ["LivithStorybook"]),
            runAction: .runAction(executable: "LivithStorybook")
        )
    ]
)
