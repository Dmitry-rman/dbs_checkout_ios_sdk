// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IPTCheckout",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "IPTCheckout",
            targets: ["IPTCheckout"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "IPTCheckout"),
        .binaryTarget(
            name: "IPTCheckoutCore",
            url: "https://46009.selcdn.ru/public/iptcheckout/IPTCheckoutCore.xcframework.zip",
            checksum: "0635556eb2b6fa81bbd05429b1f9f9c24d4c731d27b91f8f61df41f84bd1ae69"
        ),
        .binaryTarget(
            name: "IPTCheckoutSDK",
            url: "https://46009.selcdn.ru/public/iptcheckout/IPTCheckoutSDK.xcframework.zip",
            checksum: "a86629de04b34220b1bccc13c95171f0616cbee10ef2f03f89cd18480f631133"
        ),
    ]
)
