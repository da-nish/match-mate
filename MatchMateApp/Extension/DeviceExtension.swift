//
//  DeviceExtension.swift
//  MatchMateApp
//
//  Created by PropertyShare on 28/03/25.
//

import Foundation

extension ProcessInfo {
    static func isOnPreview() -> Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
 }
