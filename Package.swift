// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MoodSync",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .executable(
            name: "MoodSync",
            targets: ["MoodSync"]),
    ],
    targets: [
        .executableTarget(
            name: "MoodSync",
            path: "MoodSync",
            exclude: [
                "Tests"
            ]
        ),
        .testTarget(
            name: "MoodSyncTests",
            dependencies: ["MoodSync"],
            path: "MoodSync/Tests"
        ),
    ]
)
