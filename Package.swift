// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "GeneratePackageYML",
    targets: [
        .executableTarget(
            name: "GeneratePackageYML",
            path: "Sources"),
    ]
)