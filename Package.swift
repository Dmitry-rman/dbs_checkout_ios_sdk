// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "DBSCheckout",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "DBSCheckout",
                 targets: ["DBSCheckoutSDK","DBSCheckoutCore"])
    ],
    targets: [
        .binaryTarget(
            name: "DBSCheckoutCore",
            url: "https://github.com/Dmitry-rman/inplat_checkout_ios_sdk/releases/download/0.3.0/DBSCheckoutCore.xcframework.zip",
            checksum: "0635556eb2b6fa81bbd05429b1f9f9c24d4c731d27b91f8f61df41f84bd1ae69"
        ),
        .binaryTarget(
            name: "DBSCheckoutSDK",
            url: "https://github.com/Dmitry-rman/inplat_checkout_ios_sdk/releases/download/0.3.0/DBSCheckoutSDK.xcframework.zip",
            checksum: "a86629de04b34220b1bccc13c95171f0616cbee10ef2f03f89cd18480f631133"
        )
    ]
)
