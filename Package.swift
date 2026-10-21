// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-stripe",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "Stripe", targets: ["Stripe"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-stripe-standard.git", branch: "main")
    ],
    targets: [
        .target(
            name: "Stripe",
            dependencies: [
                .product(name: "Stripe Events Types", package: "swift-stripe-standard"),
                .product(name: "Stripe Types Shared", package: "swift-stripe-standard"),
            ]
        ),
        .testTarget(
            name: "Stripe Tests",
            dependencies: [
                .target(name: "Stripe"),
                .product(name: "Stripe Types Shared", package: "swift-stripe-standard"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableUpcomingFeature("StrictUnsafe"),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
]

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + swiftSettings
}
