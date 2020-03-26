//
//  UIView+Expand.swift
//  ChanMaMa
//
//  Created by 庄园 on 2020/2/25.
//  Copyright © 2020 庄园. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
  
    static func seperatorLine() -> UIView {
        let line = UIView()
        line.backgroundColor = UIColor(ts_hexString: "#E3E4E5")
        return line
    }
    
    static func drawDashLine(lineView : UIView,lineLength : Int ,lineSpacing : Int,lineColor : UIColor) -> UIView {

        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = lineView.bounds
        //        只要是CALayer这种类型,他的anchorPoint默认都是(0.5,0.5)
        shapeLayer.anchorPoint = CGPoint(x: 0, y: 0)
        //        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.strokeColor = lineColor.cgColor
        
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        
        shapeLayer.lineDashPattern = [NSNumber(value: lineLength),NSNumber(value: lineSpacing)]
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        if lineView.frame.size.width > lineView.frame.size.height {
            path.addLine(to: CGPoint(x: lineView.frame.size.width, y: 0))
            shapeLayer.lineWidth = lineView.frame.size.height

        } else {
            path.addLine(to: CGPoint(x: 0, y: lineView.frame.size.height))
              shapeLayer.lineWidth = lineView.frame.size.width

        }
    
        shapeLayer.path = path
        lineView.layer.addSublayer(shapeLayer)
        return lineView
    }
    
    func getTopVC() -> UIViewController? {
        var window = UIApplication.shared.keyWindow
        //是否为当前显示的window
        if window?.windowLevel != UIWindow.Level.normal{
            let windows = UIApplication.shared.windows
            for  windowTemp in windows{
                if windowTemp.windowLevel == UIWindow.Level.normal{
                    window = windowTemp
                    break
                }
            }
        }
        let vc = window?.rootViewController
        return getTopVC(withCurrentVC: vc)
    }
    
    ///根据控制器获取 顶层控制器
    func getTopVC(withCurrentVC VC :UIViewController?) -> UIViewController? {
        if VC == nil {
            print("🌶： 找不到顶层控制器")
            return nil
        }
        if let presentVC = VC?.presentedViewController {
            //modal出来的 控制器
            return getTopVC(withCurrentVC: presentVC)
        }else if let tabVC = VC as? UITabBarController {
            // tabBar 的跟控制器
            if let selectVC = tabVC.selectedViewController {
                return getTopVC(withCurrentVC: selectVC)
            }
            return nil
        } else if let naiVC = VC as? UINavigationController {
            // 控制器是 nav
            return getTopVC(withCurrentVC:naiVC.visibleViewController)
        } else {
            // 返回顶控制器
            return VC
        }
    }
}
