// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "tuist-swiftformat",
    platforms: [.macOS(.v11)],
    products: [
        .executable(
            name: "tuist-lint",
            targets: ["TuistPluginSwiftFormat"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/tuist/ProjectAutomation", .exact("3.2.0")),
        .package(url: "https://github.com/realm/SwiftLint", .exact("0.46.5")),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", .exact("0.50.7")), // it is a core dependency of the plugin, the version should be under control and locked
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMinor(from: "1.0.0")),
    ],
    targets: [
        .executableTarget(
            name: "TuistPluginSwiftFormat",
            dependencies: [
                "TuistPluginSwiftFormatFramework",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .target(
            name: "TuistPluginSwiftFormatFramework",
            dependencies: [
                .product(name: "ProjectAutomation", package: "ProjectAutomation"),
                .product(name: "SwiftFormat", package: "SwiftFormat")
            ]
        )
    ]
)
