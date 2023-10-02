//
//  Extensions.swift
//  SDD
//
//  Created by Rahmat Susanto on 02/10/23.
//

import UIKit

extension UIColor{
    static func setRGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func mainBlue() -> UIColor{
        return UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)
    }
    
    static func purple() -> UIColor{
        return UIColor.setRGB(red: 98, green: 0, blue: 238)
    }
    
    static func pink() -> UIColor{
        return UIColor.setRGB(red: 255, green: 148, blue: 194)
    }
    
    static func teal() -> UIColor{
        return UIColor.setRGB(red: 3, green: 218, blue: 197)
    }
}
