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
            revision: "175dce990f575e96be85c34ffc41183cbd4323c6",
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
