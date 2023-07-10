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
            url: "https://github.com/Dmitry-rman/dbs_checkout_ios_sdk/releases/download/0.4.1/DBSCheckoutCore.xcframework.zip",
            checksum: "706cbcfc0c2280d4cdde38603f8bde769450f2e92d6cf34442f5303fed9af846"
        ),
        .binaryTarget(
            name: "DBSCheckoutSDK",
            url: "https://github.com/Dmitry-rman/dbs_checkout_ios_sdk/releases/download/0.4.1/DBSCheckoutSDK.xcframework.zip",
            checksum: "a17368f53c9f0607ba8747b8d10ccf83b47919d03f637437c1cc863639230388"
        )
    ]
)
