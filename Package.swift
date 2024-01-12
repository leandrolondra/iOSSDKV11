// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AcuantiOSSDKV11",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AcuantCamera",
            targets: ["AcuantCameraTarget"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "AcuantCommon",
            path: "EmbeddedFrameworks/AcuantCommon.xcframework"
        ),
        .binaryTarget(
            name: "AcuantImagePreparation",
            path: "EmbeddedFrameworks/AcuantImagePreparation.xcframework"
        ),
        .binaryTarget(
            name: "libtesseract",
            path: "EmbeddedFrameworks/libtesseract.xcframework"
        ),
        .target(
            name: "AcuantCameraTarget",
            dependencies: [
                "AcuantCommon",
                "AcuantImagePreparation",
                "libtesseract"
            ],
            path: "AcuantCamera/AcuantCamera",
            resources: [.process("Media.xcassets")],
            publicHeadersPath: "AcuantCamera.h",
            linkerSettings: [
                .linkedLibrary("c++"),
                .linkedLibrary("z"),
                .linkedFramework("CoreImage"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("Foundation"),
                .linkedFramework("UIKit")
            ]
        )
    ]
)
