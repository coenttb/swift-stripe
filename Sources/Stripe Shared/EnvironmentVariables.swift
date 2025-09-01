//
//  File.swift
//  coenttb-stripe
//
//  Created by Coen ten Thije Boonkkamp on 13/08/2025.
//

import Foundation
import EnvironmentVariables

extension EnvVars {
    package static var development: Self {
        @Dependency(\.projectRoot) var projectRoot
        return try! .live(environmentConfiguration: .projectRoot(projectRoot, environment: "development"), requiredKeys: [])
    }
}

extension URL {
    package static var stripe: URL {
        .init(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
    }
}
