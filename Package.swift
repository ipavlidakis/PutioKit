// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Put.io-Kit",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Put.io-Kit",
            targets: ["Put.io-Kit"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/ipavlidakis/NetworkMe.git",
            .branch("develop")),
        .package(
            url: "https://github.com/ipavlidakis/ReduxMe.git",
            .branch("develop"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Put.io-Kit",
            dependencies: ["NetworkMe", "ReduxMe"]),
        .testTarget(
            name: "Put.io-KitTests",
            dependencies: ["Put.io-Kit"]),
    ]
)
