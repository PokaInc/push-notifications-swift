// swift-tools-version:5.5

import PackageDescription

let package = Package(name: "PusherNotifications",
                      platforms: [.macOS(.v11),
                                  .iOS(.v13)],
                      products: [
                        .library(name: "PusherNotifications",
                                 targets: ["PusherNotifications"])
                      ],
                      dependencies: [
                      ],
                      targets: [
                        .target(name: "PusherNotifications",
                                path: "Sources")
                      ],
                      swiftLanguageVersions: [.v5])
