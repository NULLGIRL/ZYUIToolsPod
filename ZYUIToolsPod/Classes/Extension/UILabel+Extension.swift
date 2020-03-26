//
//  UILabel+Extension.swift
//  ChanMaMa
//
//  Created by 庄园 on 2020/2/25.
//  Copyright © 2020 庄园. All rights reserved.
//

import Foundation
import UIKit

// 字体样式
public enum FactoryWay {
    case light
    case regular
    case middle
    case large
}

public extension UILabel {
    convenience init(_ way: FactoryWay = .regular,
                     title: String,
                     color: UIColor,
                     fontNum: CGFloat,
                     alignment: NSTextAlignment = .left,
                     lines: Int = 1){
        self.init()
        text = title
        textColor = color
        textAlignment = alignment
        numberOfLines = lines
        
        switch way {
        case .light:
            font = UIFont.lightFont(fontNum)
        case .regular:
            font = UIFont.regularFont(fontNum)
        case .middle:
            font = UIFont.mediaFont(fontNum)
        case .large:
            font = UIFont.boldFont(fontNum)
        }
    }
    
    convenience init(title: String,
                     color: UIColor,
                     fontSize: UIFont,
                     alignment: NSTextAlignment = .left,
                     lines: Int = 1){
        self.init()
        text = title
        textColor = color
        font = fontSize
        textAlignment = alignment
        numberOfLines = lines
    }
    
    static func mediaLabel(_ title: String,
                           color: UIColor,
                           font: CGFloat) -> UILabel{
        
        let label = UILabel()
        label.text = title
        label.textColor = color
        label.font = UIFont.mediaFont(font)
        label.textAlignment = .left
        return label
    }
    
    static func factoryRegularLabel(_ title: String,
                                    color: UIColor,
                                    font: CGFloat) -> UILabel{
        
        let label = UILabel()
        label.text = title
        label.textColor = color
        label.font = UIFont.regularFont(font)
        label.textAlignment = .left
        return label
    }
    
    static func factoryBoldLabel(_ title: String,
                                 color: UIColor,
                                 font: CGFloat) -> UILabel{
        
        let label = UILabel()
        label.text = title
        label.textColor = color
        label.font = UIFont.boldFont(font)
        label.textAlignment = .left
        return label
    }
    
    static func lightLabel(_ title: String,
                           color: UIColor,
                           font: CGFloat) -> UILabel{
        
        let label = UILabel()
        label.text = title
        label.textColor = color
        label.font = UIFont.lightFont(font)
        label.textAlignment = .left
        return label
    }
    
    
    /// 文字间距
    ///
    /// - Parameters:
    ///   - lineSpace: 行间距
    ///   - wordSpace: 文字间距
    static func changeLabelRowSpace(lineSpace: CGFloat, wordSpace: CGFloat, label: UILabel) {
        guard let content = label.text else { return }
        let attributedString : NSMutableAttributedString = NSMutableAttributedString(string: content)
        let paragraphStyle : NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        paragraphStyle.alignment = .center
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, (content.count)))
        attributedString.addAttribute(NSAttributedString.Key.kern, value: wordSpace, range: NSMakeRange(0, (content.count)))
        label.attributedText = attributedString
        label.sizeToFit()
    }
    
    /// 文字间距
    ///
    /// - Parameters:
    ///   - lineSpace: 行间距
    ///   - wordSpace: 文字间距
    ///   - alignment: 文字布局
    static func changeLabelRowSpace(lineSpace: CGFloat, wordSpace: CGFloat, label: UILabel, alignment: NSTextAlignment) {
        guard let content = label.text else { return }
        let attributedString : NSMutableAttributedString = NSMutableAttributedString(string: content)
        let paragraphStyle : NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        paragraphStyle.alignment = alignment
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, (content.count)))
        attributedString.addAttribute(NSAttributedString.Key.kern, value: wordSpace, range: NSMakeRange(0, (content.count)))
        label.attributedText = attributedString
        label.sizeToFit()
    }
}
