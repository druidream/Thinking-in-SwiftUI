//
//  SafeAreaInsetsKey.swift
//  SafeAreaEnvironmentKey
//
//  Created by Jun Gu on 3/21/24.
//

import SwiftUI

// https://danielsaidi.com/blog/2022/05/23/creating-an-environment-key-to-get-safe-area-insets
// https://stackoverflow.com/questions/57116723/how-to-access-safe-area-size-in-swiftui

#if os(iOS) || os(tvOS)
private extension UIApplication {

    var keyWindow: UIWindow? {
        connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .filter { $0.isKeyWindow }
            .first
    }
}
#endif

#if canImport(UIKit)
private extension UIEdgeInsets {

    var edgeInsets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
#endif

private struct SafeAreaInsetsKey: EnvironmentKey {

    static var defaultValue: EdgeInsets {
        #if os(iOS) || os(tvOS)
        let keyWindow = UIApplication.shared.keyWindow
        return keyWindow?.safeAreaInsets.edgeInsets ?? EdgeInsets()
        #else
        EdgeInsets()
        #endif
    }
}

public extension EnvironmentValues {

    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}
