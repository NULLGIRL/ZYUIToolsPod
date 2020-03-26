//
//  UIFont+Extension.swift
//  ChanMaMa
//
//  Created by 庄园 on 2020/2/25.
//  Copyright © 2020 庄园. All rights reserved.
//

import Foundation
import UIKit

public extension UIFont {
    
    static func regularFont(_ size: CGFloat) -> UIFont?{
        return UIFont.init(name: "PingFangSC-Regular", size: size)
    }
    
    static func mediaFont(_ size: CGFloat) -> UIFont?{
      return  UIFont.init(name: "PingFangSC-Medium", size: size)
    }
    
    static func boldFont(_ size: CGFloat) -> UIFont?{
         return  UIFont.init(name: "PingFangSC-Semibold", size: size)
    }
    
    static func lightFont(_ size: CGFloat) -> UIFont?{
        return  UIFont.init(name: "PingFangSC-Light", size: size)
    }
    
    static func numberFont(_ size: CGFloat) -> UIFont? {
        return  UIFont.init(name: "HelveticaNeue-BoldCond", size: size)
    }
    
    static func condensedBoldFont(_ size: CGFloat) -> UIFont? {
        return  UIFont.init(name: "HelveticaNeue-CondensedBold", size: size)
    }
}
