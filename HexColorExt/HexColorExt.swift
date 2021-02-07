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
        
        var rgb: UInt32 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let scanner = Scanner(string: hexSanitized)
        scanner.scanHexInt32(&rgb)
        
        let length = hexSanitized.count
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16)
            g = CGFloat((rgb & 0x00FF00) >> 8)
            b = CGFloat(rgb & 0x0000FF)
            
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24)
            g = CGFloat((rgb & 0x00FF0000) >> 16)
            b = CGFloat((rgb & 0x0000FF00) >> 8)
            a = CGFloat(rgb & 0x000000FF)
        }
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
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

}
