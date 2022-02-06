// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AssertSwiftCLI",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AssertSwiftCLI",
            targets: ["AssertSwiftCLI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "0.2.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AssertSwiftCLI",
            dependencies: [
                .product(name: "CustomDump", package: "swift-custom-dump"),
                "ArgumentParserTestHelpers"
            ]),
        .target(
            name:
                "ArgumentParserTestHelpers",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .testTarget(
            name: "AssertSwiftCLITests",
            dependencies: ["AssertSwiftCLI"]),
    ]
)
