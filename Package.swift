// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "DBSideMenu",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "DBSideMenu",
            targets: ["DBSideMenu"]
        )
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "DBSideMenu",
            dependencies: [
            ],
            path: "DBSideMenu",
            exclude: [
                "DBSideMenuExample"
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
