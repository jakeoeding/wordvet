// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "wordvet",
    dependencies: [
        .package(
            url: "https://github.com/jakeoeding/DictionaryKit",
            revision: "929e852f16c510fca4cdc7b06c28388cd63e9343"
        )
    ],
    targets: [
        .executableTarget(
            name: "wordvet",
            dependencies: ["DictionaryKit"]
        ),
    ]
)
