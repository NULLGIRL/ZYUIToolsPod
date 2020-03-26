//
//  String+Extension.swift
//  ChanMaMa
//
//  Created by iOS on 2020/3/12.
//  Copyright © 2020 庄园. All rights reserved.
//

import Foundation

public extension String {
    private func getNormalStrSize(str: String? = nil, attriStr: NSMutableAttributedString? = nil, font: CGFloat, w: CGFloat, h: CGFloat) -> CGSize {
        if str != nil {
            let strSize = (str! as NSString).boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.regularFont(font)!], context: nil).size
            return strSize
        }
        
        if attriStr != nil {
            let strSize = attriStr!.boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, context: nil).size
            return strSize
        }
        
        return CGSize.zero
        
    }
    
    func getNormalStrH(strFont: CGFloat, w: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGFloat {
        return getNormalStrSize(str: self, font: strFont, w: w, h: CGFloat.greatestFiniteMagnitude).height
    }
    
    func getNormalStrW(strFont: CGFloat, h: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGFloat {
        return getNormalStrSize(str: self, font: strFont, w: CGFloat.greatestFiniteMagnitude , h: h).width
    }
}


public extension String {
    var tk_isDigits: Bool {
        let regex = "^[0-9]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    func tk_substring(from: Int) -> String {
        return String(dropFirst(from))
    }
    
    func tk_substring(to: Int) -> String {
        return String(dropLast(count - to))
    }
    
    func lpad(width: Int, with: String) -> String {
        let len = lengthOfBytes(using: .utf8)
        
        if len >= width {
            return self
        } else {
            return "".padding(toLength: (width - len), withPad: with, startingAt: 0) + self
        }
    }
    
    
    func tk_tidyMnemonic() -> String {
        return self.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
            .trimmingCharacters(in: .whitespaces)
    }
    ///字符串转浮点型
    func convertToDecimalNumber() -> NSDecimalNumber {
        /// NSDecimalNumber会把多余的零去掉
        return NSDecimalNumber.init(string: String.init(format: "%.4f", (self as NSString).floatValue))
    }
    
    func decimalCount() -> Int {
        let tempString = "\(self)"
        if tempString.contains(".") {
            return tempString.split(separator: ".")[1].count
        }
        return 2
    }
    
}

public extension String {
    //Range转换为NSRange
    //    func nsRange(from range: Range<String.Index>) -> NSRange {
    //        let from = range.lowerBound.samePosition(in: utf16)!
    //        let to = range.upperBound.samePosition(in: utf16)!
    //        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from),
    //                       length: utf16.distance(from: from, to: to))
    //    }
    
    //    func nsRange(from range: Range<String.Index>) -> NSRange {
    //        return NSRange(range, in: self)
    //    }
    
    //Range转换为NSRange
    //    func range(from nsRange: NSRange) -> Range<String.Index>? {
    //        guard
    //            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location,
    //                                     limitedBy: utf16.endIndex),
    //            let to16 = utf16.index(from16, offsetBy: nsRange.length,
    //                                   limitedBy: utf16.endIndex),
    //            let from = String.Index(from16, within: self),
    //            let to = String.Index(to16, within: self)
    //            else { return nil }
    //        return from ..< to
    //    }
    
    
    /// 字符长度
    static func numberOfChars(_ str: String) -> Int {
        var number = 0
        
        guard str.count > 0 else {return 0}
        
        for i in 0...str.count - 1 {
            let c: unichar = (str as NSString).character(at: i)
            
            if (c >= 0x4E00) {
                number += 2
            }else {
                number += 1
            }
        }
        return number
    }
    
    /// utf8
    static func UTF8_numberOfChars(_ str: String) -> Int {
        guard let utf8Data = str.data(using: .utf8), utf8Data.count > 0 else {
            return 0
        }
        return utf8Data.count
        
    }
}

public extension String {
    //返回字数
    var count: Int {
        let string_NS = self as NSString
        return string_NS.length
    }
    
    //使用正则表达式替换
    func pregReplace(pattern: String, with: String,
                     options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [],
                                              range: NSMakeRange(0, self.count),
                                              withTemplate: with)
    }
}
