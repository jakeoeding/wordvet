// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "Wordvet",
    products: [
        .executable(
            name: "wordvet",
            targets: ["Wordvet"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser.git",
            from: "1.7.0",
        ),
        .package(
            url: "https://github.com/jakeoeding/DictionaryKit.git",
            revision: "14440f493bcb1717b5947619c627c9f172618867",
        ),
    ],
    targets: [
        .executableTarget(
            name: "Wordvet",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "DictionaryKit",
            ],
        ),
    ],
)
