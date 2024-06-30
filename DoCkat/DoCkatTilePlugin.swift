//
//  DoCkatTilePlugin.swift
//  DoCkat
//
//  Created by Aleksandr Strizhnev on 30.06.2024.
//

import AppKit
import Combine
import SwiftUI

class DoCkatTilePlugin: NSObject, NSDockTilePlugIn {
    private var framePublisher: AnyPublisher<CGFloat, Never> {
        frameSubject.eraseToAnyPublisher()
    }
    private let frameSubject = PassthroughSubject<CGFloat, Never>()
    
    var displayLink: CVDisplayLink = {
        var dl: CVDisplayLink? = nil
        CVDisplayLinkCreateWithActiveCGDisplays(&dl)
        return dl!
    }()

    func setDockTile(_ dockTile: NSDockTile?) {
        let options: NSDictionary = [
            kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString: true
        ]
        AXIsProcessTrustedWithOptions(options)

        CVDisplayLinkSetOutputHandler(displayLink) { displayLink, inNow, inOutputTime, flageIn, flagsOut in
            let duration = inOutputTime.pointee.timeInterval - inNow.pointee.timeInterval
            
            DispatchQueue.main.async {
                self.frameSubject.send(duration)
                dockTile?.display()
            }
            return kCVReturnSuccess
        }
        
        dockTile?.contentView = NSHostingView(
            rootView: CatTileView(
                framePublisher: framePublisher
            )
        )
        dockTile?.display()
        
        CVDisplayLinkStart(displayLink)
    }
}
