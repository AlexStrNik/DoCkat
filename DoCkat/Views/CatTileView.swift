//
//  CatTileView.swift
//  DoCkat
//
//  Created by Aleksandr Strizhnev on 30.06.2024.
//

import SwiftUI
import Combine

struct CatTileView: View {
    var framePublisher: AnyPublisher<CGFloat, Never>
    
    private var dockIconElement: AXUIElement? {
        return appDockIconByName(appName: "DoCkat")
    }
    
    private var dockIconPosition: CGPoint {
        if let element = dockIconElement {
            var value: CFTypeRef?
            var iconPosition = CGRect.zero
            
            AXUIElementCopyAttributeValue(element, "AXFrame" as CFString, &value)
            AXValueGetValue(value as! AXValue, AXValueType.cgRect, &iconPosition)

            let pos = CGPoint(
                x: iconPosition.midX,
                y: iconPosition.midY - NSScreen.main!.visibleFrame.height
            )

            return pos
        }
        
        return .zero
    }
    
    @State private var eyeVector: CGPoint = .zero
    @State private var blinkState: CGFloat = 0

    var body: some View {
        CatView(
            eyeVector: eyeVector,
            blinkState: blinkState
        )
        .onReceive(framePublisher) { frame in
            let mouseDiff = CGPoint(
                x: NSEvent.mouseLocation.x - dockIconPosition.x,
                y: NSEvent.mouseLocation.y - dockIconPosition.y
            )
            let magnitude = sqrt(pow(mouseDiff.x, 2) + pow(mouseDiff.y, 2))
            self.eyeVector = CGPoint(
                x: mouseDiff.x / magnitude * 5 * min(magnitude / 200, 1),
                y: -mouseDiff.y / magnitude * 7.5 * min(magnitude / 200, 1)
            )
            self.blinkState += frame
        }
    }
}
