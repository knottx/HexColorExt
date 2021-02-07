//
//  HexColorExt.swift
//  HexColorExt
//
//  Created by Visarut Tippun on 7/2/21.
//

import UIKit

typealias HexColor = UIColor

public extension HexColor {
    
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var hexValue: UInt64 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let scanner = Scanner(string: hexSanitized)
        scanner.scanHexInt64(&hexValue)
        
        let length = hexSanitized.count
        switch length {
        case 3:
            let divisor:CGFloat = 15.0
            r = CGFloat((hexValue & 0xF00) >> 8) / divisor
            g = CGFloat((hexValue & 0x0F0) >> 4) / divisor
            b = CGFloat(hexValue & 0x00F) / divisor
            
        case 4:
            let divisor:CGFloat = 15.0
            r = CGFloat((hexValue & 0xF000) >> 12) / divisor
            g = CGFloat((hexValue & 0x0F00) >> 8) / divisor
            b = CGFloat((hexValue & 0x00F0) >> 4) / divisor
            a = CGFloat( hexValue & 0x000F) / divisor
            
        case 6:
            let divisor:CGFloat = 255.0
            r = CGFloat((hexValue & 0xFF0000) >> 16) / divisor
            g = CGFloat((hexValue & 0x00FF00) >> 8) / divisor
            b = CGFloat(hexValue & 0x0000FF) / divisor
            
        case 8:
            let divisor:CGFloat = 255.0
            r = CGFloat((hexValue & 0xFF000000) >> 24) / divisor
            g = CGFloat((hexValue & 0x00FF0000) >> 16) / divisor
            b = CGFloat((hexValue & 0x0000FF00) >> 8) / divisor
            a = CGFloat(hexValue & 0x000000FF)
            
        default:
            break
        }
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    // MARK: - From UIColor to Hex String
    
    func toHex(alpha: Bool = false) -> String? {
        guard let components = cgColor.components, components.count >= 3 else { return nil }
        
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        if components.count >= 4 {
            a = Float(components[3])
        }
        
        if alpha {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
    
    func image() -> UIImage {
        let rect:CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        self.setFill()
        UIRectFill(rect)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }

    func withAlpha(_ alpha:CGFloat) {
        self.withAlphaComponent(alpha)
    }
    
}
