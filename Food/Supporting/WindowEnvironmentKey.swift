//
//  EnvWindowKey.swift
//  Food
//
//  Created by Hanzheng Li on 5/1/21.
//

import SwiftUI

struct WindowEnvironmentKey: EnvironmentKey {
    static let defaultValue: UIWindow? = nil
}

extension EnvironmentValues {
    var window: UIWindow? {
        get { self[WindowEnvironmentKey.self] }
        set { self[WindowEnvironmentKey.self] = newValue }
    }
}
