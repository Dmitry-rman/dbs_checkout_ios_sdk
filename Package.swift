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
            url: "https://github.com/Dmitry-rman/dbs_checkout_ios_sdk/releases/download/0.3.0/DBSCheckoutCore.xcframework.zip",
            checksum: "08deb238641128d35f7b31cd3f3087852d1cb7662597fc6633b40c5bcdf13ac2"
        ),
        .binaryTarget(
            name: "DBSCheckoutSDK",
            url: "https://github.com/Dmitry-rman/dbs_checkout_ios_sdk/releases/download/0.3.0/DBSCheckoutSDK.xcframework.zip",
            checksum: "b6bf031bd88eea11d325d5045cf80efa9a48b878b0853cf2cf72b4002f98e67e"
        )
    ]
)
