import ProjectDescription

let project = Project(
    name: "Livith-DesignSystem",
    targets: [
        .target(
            name: "Livith-DesignSystem",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Livith-DesignSystem",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Livith-DesignSystem/Sources/**"],
            resources: ["Livith-DesignSystem/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "Livith-DesignSystemTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.Livith-DesignSystemTests",
            infoPlist: .default,
            sources: ["Livith-DesignSystem/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Livith-DesignSystem")]
        ),
    ]
)
