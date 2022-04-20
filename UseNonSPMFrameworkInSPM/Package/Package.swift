// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Package",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "SampleView",
            targets: ["SampleView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SampleView",
            dependencies: ["SpreadsheetView"]),

        // locate Carthage's build path
        .binaryTarget(
            name: "SpreadsheetView",
            path: "./Carthage/Build/SpreadsheetView.xcframework")
    ]
)
