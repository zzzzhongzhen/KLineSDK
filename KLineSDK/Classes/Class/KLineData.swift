//
//  KLineData.swift
//  KLineSDK
//
//  Created by vino on 2022/9/9.
//

import Foundation

struct KLineData {
    ///坐标系最高价
    var maxPrice: Double = 100.0
    ///坐标系像素高度
    var height: Double = 0.0
    ///坐标系像素宽度
    var width: Double = 0.0
    /// 开盘价
    var openPrice: Double = 0.0
    /// 收盘价
    var closePrice: Double = 0.0
    /// 当天最高价格
    var currentMaxPrice: Double = 0.0
    /// 当天最低价格
    var currentMinPrice: Double = 0.0
    /// 计算刻度
    var perDistancePrice: Double {
        maxPrice / height
    }
    ///阴线 or 阳线
    var negative: Bool {
        openPrice - closePrice > 0
    }

}
