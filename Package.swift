// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "comp333-03",
    products: [
        .executable(name: "comp333-03", targets: ["comp333-03"]),
    ],
    targets: [
        .executableTarget(name: "comp333-03", path: "src"),
    ]
)
