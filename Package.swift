// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-stripe",
    platforms: [
        .macOS(.v26),
        .iOS(.v26)
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
                .product(name: "Stripe Types Shared", package: "swift-stripe-standard")
            ]
        ),
        .testTarget(
            name: "Stripe Tests",
            dependencies: [
                .target(name: "Stripe"),
                .product(name: "Stripe Types Shared", package: "swift-stripe-standard")
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableUpcomingFeature("StrictUnsafe"),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
]

for index in package.targets.indices {
    package.targets[index].swiftSettings = (package.targets[index].swiftSettings ?? []) + swiftSettings
}
