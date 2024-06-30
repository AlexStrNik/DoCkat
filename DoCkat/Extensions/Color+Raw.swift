//
//  Color+Raw.swift
//  DoCkat
//
//  Created by Aleksandr Strizhnev on 30.06.2024.
//

import Foundation
import SwiftUI
import AppKit

extension Color: @retroactive RawRepresentable {
    public init?(rawValue: String) {
        
        guard let data = Data(base64Encoded: rawValue) else{
            self = .black
            return
        }
        
        do{
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSColor.self, from: data) ?? .black
            self = Color(color)
        } catch {
            self = .black
        }
    }
    
    public var rawValue: String {
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: NSColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()
        } catch{
            return ""
        }
    }
}
