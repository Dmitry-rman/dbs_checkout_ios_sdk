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
            url: "https://github.com/Dmitry-rman/dbs_checkout_ios_sdk/releases/download/0.4.0/DBSCheckoutCore.xcframework.zip",
            checksum: "0d019588983e411b7626ae913defe6b89a6364c75c85e1ec71e9af5c2f974ea1"
        ),
        .binaryTarget(
            name: "DBSCheckoutSDK",
            url: "https://github.com/Dmitry-rman/dbs_checkout_ios_sdk/releases/download/0.4.0/DBSCheckoutSDK.xcframework.zip",
            checksum: "fc75df780307742382c972b88d37c3a29415d8ebe2eedb5acf52738e779c14bf"
        )
    ]
)
