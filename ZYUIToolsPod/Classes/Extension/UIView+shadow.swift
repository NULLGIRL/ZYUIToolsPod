//
//  UIView+shadow.swift
//  EOSPocket
//
//  Created by 庄园 on 2019/8/30.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    /// 普通阴影 shadowOpacity: 阴影透明度 (0-1) shadowColor: 阴影颜色
    func addShadow(shadowOpacity:CGFloat, shadowColor:UIColor)  {
        self.layer.shadowColor = UIColor.init(ts_hexString: "#DCDEEA").cgColor
        self.layer.shadowOpacity = Float(shadowOpacity)
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 6
    }
    
    /// 添加圆角和阴影 radius:圆角半径 shadowOpacity: 阴影透明度 (0-1) shadowColor: 阴影颜色
    func addRoundedOrShadow(radius:CGFloat, shadowOpacity:CGFloat, shadowColor:UIColor)  {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        let subLayer = CALayer()
        let fixframe = self.frame
        subLayer.frame = self.frame
        subLayer.cornerRadius = radius
        subLayer.backgroundColor = UIColor.white.cgColor
        subLayer.masksToBounds = false
        subLayer.shadowColor = shadowColor.cgColor // 阴影颜色
        subLayer.shadowOffset = CGSize(width: 0, height: 0) // 阴影偏移,width:向右偏移3，height:向下偏移2，默认(0, -3),这个跟shadowRadius配合使用
        subLayer.shadowOpacity = Float(shadowOpacity) //阴影透明度
        subLayer.shadowRadius = 3//阴影半径，默认3
        self.superview?.layer.insertSublayer(subLayer, below: self.layer)
    }
    
    func configRectCorner(bounds: CGRect, corner: UIRectCorner, radii: CGSize) -> CALayer {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corner, cornerRadii: radii)
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        return maskLayer
    }
    
    func setTopCorners(radius:CGFloat = 10) {
        
        let corners: UIRectCorner = [.topLeft,.topRight]
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    func setBottomCorners(radius:CGFloat = 10) {
        
        let corners: UIRectCorner = [.bottomLeft,.bottomRight]
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        
        let subLayer = CALayer()
        subLayer.frame = self.frame
        subLayer.cornerRadius = radius
        subLayer.backgroundColor = UIColor.white.cgColor
        subLayer.masksToBounds = false
        subLayer.shadowColor = UIColor.init(ts_hexString: "#939899").cgColor // 阴影颜色
        subLayer.shadowOffset = CGSize(width: 2, height: 5) // 阴影偏移,width:向右偏移3，height:向下偏移2，默认(0, -3),这个跟shadowRadius配合使用
        subLayer.shadowOpacity = Float(0.04) //阴影透明度
        subLayer.shadowRadius = 4//阴影半径，默认3
        self.superview?.layer.insertSublayer(subLayer, below: self.layer)
    }
    
    func setTopCornersAndShadow(radius:CGFloat = 10, rect: CGRect? = nil) {
        var roundedRect: CGRect = bounds
        if rect != nil {
            roundedRect = rect!
        }
        let corners: UIRectCorner = [.topLeft,.topRight]
        let maskPath = UIBezierPath(roundedRect: roundedRect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        
        let subLayer = CALayer()
        subLayer.frame = CGRect(x: 0, y: 10, width: bounds.width, height: bounds.height)
        subLayer.cornerRadius = radius
        subLayer.backgroundColor = UIColor.white.cgColor
        subLayer.masksToBounds = false
        subLayer.shadowColor = UIColor.init(ts_hexString: "#939899").cgColor // 阴影颜色
        subLayer.shadowOffset = CGSize(width: 0, height: -4) // 阴影偏移,width:向右偏移3，height:向下偏移2，默认(0, -3),这个跟shadowRadius配合使用
        subLayer.shadowOpacity =
            Float(0.04) //阴影透明度
        subLayer.shadowRadius = 4//阴影半径，默认3
        self.superview?.layer.insertSublayer(subLayer, above: layer)
    }
    
    func setCornersAndShadow(radius: CGFloat = 10) {
        layer.shadowColor = UIColor.red.cgColor
        layer.shadowRadius = radius
        layer.shadowOffset = CGSize(width: 0, height: -4)
        layer.shadowOpacity = Float(0.04)
        layer.cornerRadius = radius
    }
}


