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
            revision: "448915c89029aa8c42944d57fbc5da52928a82e4",
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
