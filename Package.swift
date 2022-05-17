// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "ServiceLocator",
    products: [
        .library(
            name: "ServiceContainer",
            targets: ["ServiceContainer"]
        ),
        .library(
            name: "ServiceLocator",
            targets: ["ServiceLocator"]
        ),
    ],
    targets: [
        .target(
            name: "ServiceContainer",
            dependencies: [],
            path: "Sources/ServiceContainer"
        ),
        .target(
            name: "ServiceLocator",
            dependencies: [
                "ServiceContainer",
            ],
            path: "Sources/ServiceLocator"
        ),
        .testTarget(
            name: "ServiceContainerTests",
            dependencies: ["ServiceContainer"]
        ),
        .testTarget(
            name: "ServiceLocatorTests",
            dependencies: ["ServiceLocator"]
        ),
    ]
)
