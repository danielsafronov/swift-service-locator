// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "ServiceLocator",
    products: [
        .library(
            name: "ServiceLocator",
            targets: ["ServiceLocator"]),
    ],
    targets: [
        .target(
            name: "ServiceLocator",
            dependencies: []),
        .testTarget(
            name: "ServiceLocatorTests",
            dependencies: ["ServiceLocator"]),
    ]
)
