//
//  DoCkatApp.swift
//  DoCkat
//
//  Created by Aleksandr Strizhnev on 28.06.2024.
//

import SwiftUI
import Combine

@main
struct DoCkatApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        #if os(macOS)
        Settings {
            SettingsView()
                .frame(minWidth: 350, minHeight: 250)
        }
        #endif
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    @Environment(\.openSettings) private var openSettings

    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows: Bool) -> Bool {
        openSettings()
        return true
    }
}
