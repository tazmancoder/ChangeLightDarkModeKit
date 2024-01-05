// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChangeLightDarkModeKit",
	platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ChangeLightDarkModeKit",
            targets: ["ChangeLightDarkModeKit"]),
    ],
	dependencies: [
		.package(url: "https://github.com/devicekit/DeviceKit.git", from: "4.0.0")
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ChangeLightDarkModeKit",
			dependencies: [
				"DeviceKit",
			],
			resources: [.process("LightDarkModeKitAssets.xcassets")]),
        .testTarget(
            name: "ChangeLightDarkModeKitTests",
            dependencies: ["ChangeLightDarkModeKit"]),
    ]
)
