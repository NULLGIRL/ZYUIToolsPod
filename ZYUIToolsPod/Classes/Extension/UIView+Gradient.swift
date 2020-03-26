//
//  UIView+Gradient.swift
//  EOSPocket
//
//  Created by 庄园 on 2019/8/9.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation
import UIKit
/// 
public extension UIView {
    
    func gradient(topColor: UIColor = UIColor.init(ts_hexString: "#09BEF5"), bottomColor: UIColor = UIColor.init(ts_hexString: "#446EFE") ) {
        if let currentlayers = self.layer.sublayers {
            for layer in currentlayers {
                if layer.name == "gradientLayer" {
                    layer.removeFromSuperlayer()
                }
            }
        }
        
        let gradientColors = [topColor.cgColor, bottomColor.cgColor]

        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        
        //创建CAGradientLayer对象并设置参数
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "gradientLayer"
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0)
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        
        gradientLayer.shadowColor = UIColor.init(ts_hexString: "#0EB7F6", alpha: 0.3).cgColor
        gradientLayer.shadowOffset = CGSize.init(width: 0, height: 3);
        gradientLayer.shadowOpacity = 1
        gradientLayer.shadowRadius = 10
        gradientLayer.cornerRadius = self.height * 0.5
        
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        if let currentlayers = self.layer.sublayers {
            print(currentlayers)
        }
        //设置其CAGradientLayer对象的frame，并插入view的layer
//        currentlayer = gradientLayer

    }
    
    /// 水平阴影渐变
    func setupBackground(topColor: UIColor, bottomColor: UIColor) {
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        let gradientColors = [topColor.cgColor, bottomColor.cgColor]
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 0, y: 1)
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    /// 垂直阴影渐变
    func setupVerticalBackground(leftColor: UIColor, rightColor: UIColor) {
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        let gradientColors = [leftColor.cgColor, rightColor.cgColor]
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0)
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
