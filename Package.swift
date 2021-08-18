// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "comp333-03",
    products: [
        .library(name: "MyList", targets: ["MyList"]),
    ],
    targets: [
        .target(name: "MyList", path: "src"),
        .testTarget(name: "MyListTests", dependencies: ["MyList"], path: "tests"),
    ]
)
