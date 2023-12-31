// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClickmeliveiOSSDKPackage",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "ClickmeliveiOSSDKPackage",
            targets: ["ClickmeliveiOSSDKPackage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.4")),
        .package(url: "https://github.com/daltoniam/Starscream.git", from: "4.0.0"),
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.2.0")
    ],
    targets: [
        .target(
            name: "ClickmeliveiOSSDKPackage",
            dependencies: ["ClickmeliveiOSSDKTarget"]),
        .testTarget(
            name: "ClickmeliveiOSSDKPackageTests",
            dependencies: ["ClickmeliveiOSSDKPackage"]),
        .target(
            name: "ClickmeliveiOSSDKTarget",
            dependencies: [.target(name: "ClickmeliveiOSSDKWrapper", condition: .when(platforms: [.iOS]))],
            path: "ClickmeliveiOSSDKTarget"
        ),
        .target(
            name: "ClickmeliveiOSSDKWrapper",
            dependencies: [
                .target(name: "ClickmeliveiOSSDK", condition: .when(platforms: [.iOS])),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "Starscream", package: "Starscream"),
                .product(name: "Lottie", package: "lottie-spm"),
                .target(name: "AmazonIVSPlayer", condition: .when(platforms: [.iOS])),
                .target(name: "PIPKit", condition: .when(platforms: [.iOS])),
                .target(name: "SDWebImage", condition: .when(platforms: [.iOS]))
            ],
            path: "ClickmeliveiOSSDKWrapper"
        ),
        .binaryTarget(name: "AmazonIVSPlayer", path: "AmazonIVSPlayer.xcframework"),
        .binaryTarget(name: "ClickmeliveiOSSDK", path: "ClickmeliveiOSSDK.xcframework"),
        .binaryTarget(name: "PIPKit", path: "PIPKit.xcframework"),
        .binaryTarget(name: "SDWebImage", path: "SDWebImage.xcframework")
        
    ]
)
