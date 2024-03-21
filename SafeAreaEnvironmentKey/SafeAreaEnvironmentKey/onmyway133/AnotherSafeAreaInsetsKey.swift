//
//  SafeAreaInsetsKey.swift
//  SafeAreaEnvironmentKey
//
//  Created by Jun Gu on 3/21/24.
//

import SwiftUI

// https://onmyway133.com/posts/how-to-read-safe-area-insets-in-swiftui/

private struct SafeAreaInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        UIApplication.shared.keyWindow?.safeAreaInsets.swiftUIInsets ?? EdgeInsets()
    }
}

private extension UIEdgeInsets {
    var swiftUIInsets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}

private extension UIApplication {
    var keyWindow: UIWindow? {
        connectedScenes
            .compactMap {
                $0 as? UIWindowScene
            }
            .flatMap {
                $0.windows
            }
            .first {
                $0.isKeyWindow
            }
    }
}

public extension EnvironmentValues {

    var anotherSafeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}


///*
//struct MessageBar: View {
//    @Environment(\.safeAreaInsets) private var safeAreaInsets
//}
//*/
