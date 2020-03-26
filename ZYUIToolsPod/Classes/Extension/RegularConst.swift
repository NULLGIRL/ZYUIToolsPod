//
//  Const.swift
//  ChanMaMa
//
//  Created by 庄园 on 2020/2/24.
//  Copyright © 2020 庄园. All rights reserved.
//

import UIKit

/**
 机型
 */
public let isIPhoneX: Bool = screenHeight == 812 ? true : false
public let isIphoneSmall: Bool = screenHeight <= 568 ? true : false
public let isIPhoneXAll: Bool = screenHeight == 812 || screenHeight == 896 ? true : false

/**
 常用尺寸
 */
/// 屏幕的宽度
public let screenWidth = UIScreen.main.bounds.width
/// 屏幕的高度
public let screenHeight = UIScreen.main.bounds.height
/// 状态栏高度
public let statusBarHeight = UIApplication.shared.statusBarFrame.height
/// 导航栏高度
public let naviBarHeight:CGFloat = 44.0
/// 底部工具栏高度
public let tabarHeight:CGFloat = 49.0
/// 底部安全区域高度
public let bottomSafeHeight: CGFloat = (isIPhoneXAll ? 34.0 : 0.0)
/// 1像素的线
public let SINGLE_LINE_PIXEL: CGFloat = 1/UIScreen.main.scale

/**
 高宽比
 */
//宽度缩小系数
public let TaurusWidthScale = UIScreen.main.bounds.size.width/375.0
//高度缩小系数
public let TaurusHeightScale = UIScreen.main.bounds.size.height/667.0
