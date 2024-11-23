// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIComponents",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UIComponents",
            targets: ["UIComponents", "UIComponentsFactory", "UIComponentsProtocols"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzysztofzablocki/Inject.git", from: "1.2.4"),
        .package(url: "https://github.com/gonzalezreal/MarkdownUI", from: "1.1.1"),
        .package(url: "https://github.com/exyte/ActivityIndicatorView.git", from: "1.1.1"),
        .package(url: "https://github.com/Kajalluthra/Core.git", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "UIComponentsProtocols",
            dependencies: ["Core"]),
        .target(
            name: "UIComponents",
            dependencies: ["UIComponentsProtocols", "Inject", "Core", "MarkdownUI", "ActivityIndicatorView"],
            resources: [.process("Resources")]),
        .target(
            name: "UIComponentsFactory",
            dependencies: ["UIComponentsProtocols", "UIComponents"]),
        .testTarget(
            name: "UIComponentsTests",
            dependencies: ["UIComponents"],
            resources: [
                .process("Theme/json")
            ]),
    ]
)
