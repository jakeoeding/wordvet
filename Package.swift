// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "wordvet",
    dependencies: [
        .package(
            url: "https://github.com/jakeoeding/DictionaryKit",
            revision: "6965031d373d863a9d44d2d939d76aa54dea0deb",
        ),
    ],
    targets: [
        .executableTarget(
            name: "wordvet",
            dependencies: ["DictionaryKit"],
        ),
    ],
)
