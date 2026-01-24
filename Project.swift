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
            dependencies: []
        ),
    ],
    schemes: [
        .scheme(
            name: "LivithStorybook",
            buildAction: .buildAction(targets: ["LivithStorybook"]),
            runAction: .runAction(executable: "LivithStorybook")
        )
    ]
)
