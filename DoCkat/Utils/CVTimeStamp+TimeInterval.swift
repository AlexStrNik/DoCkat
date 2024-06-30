//
//  CVTimeStamp+Duration.swift
//  DoCkat
//
//  Created by Aleksandr Strizhnev on 30.06.2024.
//

import AppKit

extension CVTimeStamp {
    var timeInterval: TimeInterval {
        return TimeInterval(videoTime) / TimeInterval(self.videoTimeScale)
    }
}
