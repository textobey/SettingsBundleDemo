//
//  ServerConfiguration.swift
//  SettingsBundleDemo
//
//  Created by 이서준 on 2023/01/05.
//

import Foundation

/// Enum For Server Preferences
@frozen enum ServerEnvironmentType: String {
    case dev     = "Development"
    case staging = "Staging"
    case pro     = "Release"

    /// Multi Value Identifier where Settings.bundle
    fileprivate static var APP_ENV_USER_DEFAULTS_KEY: String {
        return "app_server_preference_settings"
    }
}

extension ServerEnvironmentType {
    static let current: ServerEnvironmentType = fetchPlistSavedAppEnvUserDefaultsKey()
}

extension ServerEnvironmentType {
    private static func fetchPlistSavedAppEnvUserDefaultsKey() -> ServerEnvironmentType {
        let bundleKey = ServerEnvironmentType.APP_ENV_USER_DEFAULTS_KEY
        if let preference = UserDefaults.standard.value(forKey: bundleKey) as? String {
            return ServerEnvironmentType(rawValue: preference)!
        }
        return .pro
    }
}
