//
//  UIFont.swift
//  TopColors
//
//  Created by Roman Muzikantov on 10/08/2021.
//

import Foundation
import UIKit

extension UIFont {
    class func montserratLight(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Light", size: size)!
    }
    
    class func montserratRegular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Regular", size: size)!
    }
    
    class func montserratBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-SemiBold", size: size)!
    }
}
