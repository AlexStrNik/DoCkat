//
//  FindDockElement.swift
//  DoCkat
//
//  Created by Aleksandr Strizhnev on 30.06.2024.
//

import AppKit
import ApplicationServices

func appDockIconByName(appName: String) -> AXUIElement? {
    let options: NSDictionary = [
        kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString: false
    ]
    let accessibilityEnabled = AXIsProcessTrustedWithOptions(options)
    
    if !accessibilityEnabled {
        return nil
    }
    
    guard let dockApp = NSRunningApplication.runningApplications(
        withBundleIdentifier: "com.apple.dock"
    ).last else {
        return nil
    }

    let appElement = AXUIElementCreateApplication(dockApp.processIdentifier)
    
    guard let firstChildArray = subelementsFromElement(appElement, attribute: kAXChildrenAttribute) else {
        return nil
    }
    let firstChild = firstChildArray.first as! AXUIElement

    guard let children = subelementsFromElement(firstChild, attribute: kAXChildrenAttribute) else {
        return nil
    }

    for axElement in children {
        let axElement = axElement as! AXUIElement
        var value: CFTypeRef?
        let result = AXUIElementCopyAttributeValue(axElement, kAXTitleAttribute as CFString, &value)

        if result == .success, let value = value {
            let titleValue: Any
            if CFGetTypeID(value) != AXValueGetTypeID() {
                titleValue = value
            } else {
                titleValue = NSValue(pointer: Unmanaged.passUnretained(value).toOpaque())
            }

            if let titleValue = titleValue as? String, titleValue == appName {
                return axElement
            }
        }
    }

    return nil
}

func subelementsFromElement(_ element: AXUIElement, attribute: String) -> [AXUIElement]? {
    var count: CFIndex = 0
    var result = AXUIElementGetAttributeValueCount(element, attribute as CFString, &count)
    
    var subElements: CFArray?
    result = AXUIElementCopyAttributeValues(element, attribute as CFString, 0, count, &subElements)
    if result != .success {
        return nil
    }
    
    return subElements as? [AXUIElement]
}
