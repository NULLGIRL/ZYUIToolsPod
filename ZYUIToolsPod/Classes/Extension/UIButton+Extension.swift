//
//  UIButton+EOS.swift
//  EOSPocket
//
//  Created by iOS on 2018/11/19.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

//MARK: -定义button相对label的位置
public enum YWButtonEdgeInsetsStyle {
    case Top
    case Left
    case Right
    case Bottom
}

public extension UIButton {
    
    public func layoutButton(style: YWButtonEdgeInsetsStyle, imageTitleSpace: CGFloat) {
        //得到imageView和titleLabel的宽高
        let imageWidth = self.imageView?.frame.size.width
        let imageHeight = self.imageView?.frame.size.height
        
        var labelWidth: CGFloat! = 0.0
        var labelHeight: CGFloat! = 0.0
        if let info = Bundle.main.infoDictionary, let version = info["CFBundleShortVersionString"] as? String {
            if (version as NSString).floatValue >= 8.0 {
                labelWidth = self.titleLabel?.intrinsicContentSize.width
                labelHeight = self.titleLabel?.intrinsicContentSize.height
            }else{
                labelWidth = self.titleLabel?.frame.size.width
                labelHeight = self.titleLabel?.frame.size.height
            }
        }
        //初始化imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets =  UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero

        //根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .Top:
            //上 左 下 右
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight-imageTitleSpace/2,
                                           left: 0,
                                           bottom: 0,
                                           right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0,
                                           left: -imageWidth!,
                                           bottom: -imageHeight!-imageTitleSpace/2,
                                           right: 0)
            break;
            
        case .Left:
            imageEdgeInsets = UIEdgeInsets(top: 0,
                                           left: -imageTitleSpace/2,
                                           bottom: 0,
                                           right: imageTitleSpace)
            labelEdgeInsets = UIEdgeInsets.init(top: 0,
                                                left: imageTitleSpace/2,
                                                bottom: 0,
                                                right: -imageTitleSpace/2)
            break;
            
        case .Bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0,
                                           left: 0,
                                           bottom: -labelHeight!-imageTitleSpace/2,
                                           right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight!-imageTitleSpace/2,
                                           left: -imageWidth!,
                                           bottom: 0,
                                           right: 0)
            break;
            
        case .Right:
            imageEdgeInsets = UIEdgeInsets.init(top: 0,
                                                left: labelWidth+imageTitleSpace/2,
                                                bottom: 0,
                                                right: -labelWidth-imageTitleSpace/2)
            labelEdgeInsets = UIEdgeInsets.init(top: 0,
                                                left: -imageWidth!-imageTitleSpace/2,
                                                bottom: 0,
                                                right: imageWidth!+imageTitleSpace/2)
            break;
            
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
    }
}
