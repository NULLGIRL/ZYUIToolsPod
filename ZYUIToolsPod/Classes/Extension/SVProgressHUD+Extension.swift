//
//  File.swift
//  ChanMaMa
//
//  Created by iOS on 2020/3/15.
//  Copyright © 2020 庄园. All rights reserved.
//

import Foundation
import SVProgressHUD

public extension SVProgressHUD {
    /// 设置 SVProgressHUD 属性
    public static func configuration() {
        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.setMinimumDismissTimeInterval(1)
        SVProgressHUD.setMaximumDismissTimeInterval(1.5)
        SVProgressHUD.setBackgroundColor(UIColor(r: 0, g: 0, b: 0, alpha: 1))
    }
}
