//
//  UIView+Extension.swift
//  ChanMaMa
//
//  Created by iOS on 2020/3/15.
//  Copyright © 2020 庄园. All rights reserved.
//

import Foundation

public extension UIView {
    func setupCorners(rect: CGRect,
                      cornerRadius: CGFloat = 5) {
        let corners: UIRectCorner = [UIRectCorner.topLeft, UIRectCorner.topRight]
        let maskPath = UIBezierPath(roundedRect: rect,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        maskLayer.frame = rect
        layer.mask = maskLayer
    }
        
    func setupShadowCorners(rect: CGRect,
                     shadowOffset: CGSize = CGSize(width: 0, height: -4),
                     cornerRadius: CGFloat = 4,
                     shadowRadius: CGFloat = 4,
                     shadowColor: UIColor = UIColor(ts_hexString: "#939899", alpha: 0.04),
                     fillColor: UIColor = UIColor.white) {
        let corners: UIRectCorner = [UIRectCorner.topLeft, UIRectCorner.topRight]
        let insetRect = rect.inset(by: UIEdgeInsets(top: shadowRadius, left: 0, bottom: 0, right: 0))
        let shadowPath = UIBezierPath(roundedRect: insetRect,
                                      byRoundingCorners: corners,
                                      cornerRadii: CGSize(width: cornerRadius,
                                                          height: cornerRadius))
        let context = UIGraphicsGetCurrentContext()
        context?.setShadow(offset: shadowOffset, blur: shadowRadius, color: shadowColor.cgColor)
        fillColor.setFill()
        shadowPath.fill()
    }
}
