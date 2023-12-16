//
//  UIColor+Extension.swift
//  MyPet
//
//  Created by Caio Fabrini on 16/12/23.
//

import Foundation
import UIKit

extension UIColor {
    
    @nonobjc class var whiteBackground: UIColor {
        return UIColor(white: 249.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var fadedOrange: UIColor {
        return UIColor(red: 223.0 / 255.0, green: 163.0 / 255.0, blue: 93.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var periwinkleBlue: UIColor {
        return UIColor(red: 140.0 / 255.0, green: 151.0 / 255.0, blue: 253.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var peach: UIColor {
        return UIColor(red: 245.0 / 255.0, green: 193.0 / 255.0, blue: 131.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var brownGrey: UIColor {
        return UIColor(white: 135.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var veryLightPink: UIColor {
      return UIColor(red: 1.0, green: 253.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var pale: UIColor {
      return UIColor(red: 242.0 / 255.0, green: 233.0 / 255.0, blue: 216.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var lightGrayColor: UIColor {
      return UIColor(white: 245.0 / 255.0, alpha: 1.0)
    }
    
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        let start = hex.hasPrefix("#") ? hex.index(hex.startIndex, offsetBy: 1) : hex.startIndex
        let hexColor = String(hex[start...])

        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
            if hexColor.count == 8 {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
            } else if hexColor.count == 6 {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat(hexNumber & 0x0000ff) / 255
                a = 1.0
            } else {
                return nil
            }

            self.init(red: r, green: g, blue: b, alpha: a)
        } else {
            return nil
        }
    }
    
}
