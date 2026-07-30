// swift-tools-version: 6.3.3

import PackageDescription

extension String {
    static let stripe: Self = "Stripe"
}

extension Target.Dependency {
    static var stripe: Self { .target(name: .stripe) }
}

extension Target.Dependency {
    // Interim: swift-stripe-types#11 introduces the consolidated `Stripe Standard`
    // product; until it lands, depend on the existing per-vocabulary `* Types` products.
    static var stripeEventsTypes: Self { .product(name: "Stripe Events Types", package: "swift-stripe-types") }
    static var stripeTypesShared: Self { .product(name: "Stripe Types Shared", package: "swift-stripe-types") }
}

let package = Package(
    name: "swift-stripe",
    platforms: [
        .macOS(.v26),
        .iOS(.v26)
    ],
    products: [
        .library(name: .stripe, targets: [.stripe])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-stripe-types.git", branch: "main")
    ],
    targets: [
        .target(
            name: .stripe,
            dependencies: [
                .stripeEventsTypes,
                .stripeTypesShared
            ]
        ),
        .testTarget(
            name: "Stripe Tests",
            dependencies: [
                .stripe
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
