// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "IPTCheckout",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "IPTCheckout",
                 targets: ["IPTCheckoutSDK","IPTCheckoutCore"])
    ],
    targets: [
        .binaryTarget(
            name: "IPTCheckoutCore",
            url: "https://github.com/Dmitry-rman/inplat_checkout_ios_sdk/blob/main/IPTCheckoutCore.xcframework.zip",
            checksum: "0635556eb2b6fa81bbd05429b1f9f9c24d4c731d27b91f8f61df41f84bd1ae69"
        ),
        .binaryTarget(
            name: "IPTCheckoutSDK",
            url: "https://github.com/Dmitry-rman/inplat_checkout_ios_sdk/blob/main/IPTCheckoutSDK.xcframework.zip",
            checksum: "a86629de04b34220b1bccc13c95171f0616cbee10ef2f03f89cd18480f631133"
        )
    ]
)
