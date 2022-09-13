//
//  KLineCell.swift
//  KLineSDK
//
//  Created by vino on 2022/9/8.
//

import Foundation
import UIKit

class KLineCell: UITableViewCell {
    
    ///K线图层
    var cylinderLayer: CylinderDrawingLayer?
    ///cell数据源
    var data: KLineData = KLineData() {
        didSet {
            setup()
        }
    }
    ///坐标数据源
    var points: [GraphPoint] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.contentView.backgroundColor = UIColor.lightGray
        self.selectionStyle = .none
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        
        points = makePoints()
        
        cylinderLayer = CylinderDrawingLayer(dataSource: self, viewPort: CGSize(width: data.width, height: data.height), negative: data.negative, lineStyle: ScrollableGraphViewLineStyle.straight)
        self.contentView.layer.addSublayer(cylinderLayer!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
/// 获取数据源
extension KLineCell: ScrollableGraphViewDataSource {
    
    func label(atIndex pointIndex: Int) -> String {
        return ""
    }
    func numberOfPoints() -> Int {
        return points.count
    }
    func pointsArray() -> [GraphPoint] {
        return points
    }
    ///计算K线各个点的坐标
    func makePoints() -> [GraphPoint] {
        let max = caculatePosition()
        let topLineHeight = caculateTopLineHeight()
        let cylinderHeight = caculateCylinderLineHeight()
        let downlineHeight = caculateDownLineHeight()

        let centerY = data.height / 2
        let startPoint = GraphPoint(position: CGPoint(x: max, y: centerY))
        let topEndPoint = GraphPoint(position: CGPoint(x: max + topLineHeight, y: centerY))
        let cylinderEndPoint = GraphPoint(position: CGPoint(x: topEndPoint.x + cylinderHeight, y: centerY))
        let downEndPoint = GraphPoint(position: CGPoint(x: cylinderEndPoint.x + downlineHeight, y: centerY))
        
        let points = [startPoint, topEndPoint, cylinderEndPoint, downEndPoint]
        return points
    }
}

///计算
extension KLineCell {
    func caculatePosition() -> Double {
        return (data.maxPrice - data.currentMaxPrice) * data.perDistancePrice
    }
    func caculateTopLineHeight() -> Double {
        let openPricePoint = data.negative ? (data.currentMaxPrice - data.openPrice) * data.perDistancePrice : (data.currentMaxPrice - data.closePrice) * data.perDistancePrice
        return openPricePoint
    }
    func caculateCylinderLineHeight() -> Double {
        let openPricePoint = data.negative ? (data.openPrice - data.closePrice) * data.perDistancePrice : (data.closePrice - data.openPrice) * data.perDistancePrice
        return openPricePoint
    }
    func caculateDownLineHeight() -> Double {
        let openPricePoint = data.negative ? (data.closePrice - data.currentMinPrice) * data.perDistancePrice : (data.openPrice - data.currentMinPrice) * data.perDistancePrice
        return openPricePoint
    }

}
