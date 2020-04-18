// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "EmojiJournalServer",

    dependencies: [
      .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.8.0")),
      .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.7.1"),
      .package(url: "https://github.com/IBM-Swift/CloudEnvironment.git", from: "9.0.0"),
      .package(url: "https://github.com/RuntimeTools/SwiftMetrics.git", from: "2.0.0"),
      .package(url: "https://github.com/IBM-Swift/Health.git", from: "1.0.0"),
      .package(url: "https://github.com/IBM-Swift/Configuration.git", from: "3.0.0"),
      .package(url: "https://github.com/IBM-Swift/Kitura-CouchDB.git", .upToNextMinor(from: "3.2.0")),
      .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", .upToNextMinor(from: "1.11.1"))
    ],
    
    targets: [
      .target(name: "EmojiJournalServer", dependencies: [ .target(name: "Application") ]),
      .target(name: "Application", dependencies: [ "Kitura", "HeliumLogger", "CloudEnvironment","SwiftMetrics", "Health", "Configuration", .product(name: "CouchDB", package: "Kitura-CouchDB"), "KituraStencil"

      ]),

      .testTarget(name: "ApplicationTests" , dependencies: [.target(name: "Application"), /*"Kitura",*/ "HeliumLogger" ])
    ]
)
