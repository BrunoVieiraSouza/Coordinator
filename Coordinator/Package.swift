// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "Coordinator",
    products: [
        .library(name: "Coordinator", targets: ["Coordinator"]),
    ],
    targets: [
        .target(name: "Coordinator", dependencies: []),
        .testTarget(name: "CoordinatorTests", dependencies: ["Coordinator"]),
    ]
)
