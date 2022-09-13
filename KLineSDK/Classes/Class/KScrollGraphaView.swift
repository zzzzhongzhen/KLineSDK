//
//  dsaadsa.swift
//  KLineSDK
//
//  Created by vino on 2022/9/8.
//

import Foundation
import UIKit
import SwifterSwift
import SnapKit

open class KScrollGraphaView: UIView {
    
    @IBInspectable open var dataPointSpacing: CGFloat = 40.0
    @IBInspectable open var rangeMax: Double = 100.0
    @IBInspectable open var rangeMin: Double = 0.0
    @IBInspectable open var currentPrice: Double = 0.0
    private var datas: [KLineData] = []
    var xPoints: [GraphPoint] = []
    var yPoints: [GraphPoint] = []
    
    var coordinateXLineLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.black.cgColor
        layer.lineJoin = CAShapeLayerLineJoin.bevel
        layer.lineCap = CAShapeLayerLineCap.square
        layer.fillColor = UIColor.red.cgColor
        layer.lineWidth = 1
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 350))
        path.addLine(to: CGPoint(x: C.Screen.width - 30, y: 350))
        layer.path = path.cgPath
        return layer
    }()
    var coordinateYLineLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.black.cgColor
        layer.lineJoin = CAShapeLayerLineJoin.bevel
        layer.lineCap = CAShapeLayerLineCap.square
        layer.fillColor = UIColor.red.cgColor
        layer.lineWidth = 1
        let path = UIBezierPath()
        path.move(to: CGPoint(x: C.Screen.width - 30, y: 0))
        path.addLine(to: CGPoint(x: C.Screen.width - 30, y: 350))
        layer.path = path.cgPath
        return layer
    }()
    
    lazy var graphaTableView: UITableView = {
        let tab = UITableView.init(frame: CGRect.zero, style: UITableView.Style.plain)
        tab.separatorColor = UIColor.clear
        tab.register(KLineCell.self, forCellReuseIdentifier: "KLineCell")
//        tab.backgroundColor = .gray
        tab.showsVerticalScrollIndicator = false
        tab.showsHorizontalScrollIndicator = false
        return tab
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
     
        self.backgroundColor = UIColor.white
        setup()
        
        let maxPrice = 100.0
        var data1 = KLineData()
        data1.maxPrice = maxPrice
        data1.width = 400.0
        data1.height = dataPointSpacing
        data1.openPrice = 30.0
        data1.closePrice = 60.0
        data1.currentMaxPrice = 80.0
        data1.currentMinPrice = 8.0

        var data2 = KLineData()
        data2.maxPrice = maxPrice
        data2.width = 400.0
        data2.height = dataPointSpacing
        data2.openPrice = 40.0
        data2.closePrice = 10.0
        data2.currentMaxPrice = 90.0
        data2.currentMinPrice = 8.0

        var data3 = KLineData()
        data3.maxPrice = maxPrice
        data3.width = 400.0
        data3.height = dataPointSpacing
        data3.openPrice = 20.0
        data3.closePrice = 80.0
        data3.currentMaxPrice = 90.0
        data3.currentMinPrice = 10.0
        
        var data4 = KLineData()
        data4.maxPrice = maxPrice
        data4.width = 400.0
        data4.height = dataPointSpacing
        data4.openPrice = 20.0
        data4.closePrice = 80.0
        data4.currentMaxPrice = 90.0
        data4.currentMinPrice = 10.0

        var data5 = KLineData()
        data5.maxPrice = maxPrice
        data5.width = 400.0
        data5.height = dataPointSpacing
        data5.openPrice = 30.0
        data5.closePrice = 60.0
        data5.currentMaxPrice = 80.0
        data5.currentMinPrice = 8.0

//        datas = [data1, data2, data3, data4, data5]
        datas.append(contentsOf: [data1, data2, data3, data4, data5])
        datas.append(contentsOf: [data1, data2, data3, data4, data5])
        datas.append(contentsOf: [data1, data2, data3, data4, data5])
        datas.append(contentsOf: [data1, data2, data3, data4, data5])
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        self.addSubview(graphaTableView)
        graphaTableView.delegate = self
        graphaTableView.dataSource = self
        
        self.layer.addSublayer(coordinateXLineLayer)
        self.layer.addSublayer(coordinateYLineLayer)
        xPoints = makePoints()
        let labelsLayer = CoordinateLineDrawingLayer(dataSource: self, viewPort: CGSize(width: 1, height: 500), lineStyle: ScrollableGraphViewLineStyle.straight)
        graphaTableView.layer.addSublayer(labelsLayer)
    }
    open override func layoutSubviews() {
        super.layoutSubviews()
        graphaTableView.frame = CGRect(x: 0, y: 20, width: self.width - 60, height: self.width)
        graphaTableView.transform = CGAffineTransform(rotationAngle: Double.pi / 2)
    }
}
extension KScrollGraphaView: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return datas.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: KLineCell = tableView.dequeueReusableCell(withIdentifier: "KLineCell") as! KLineCell
        cell.data = datas[indexPath.row]
//        cell.contentView.transform = CGAffineTransform(rotationAngle: Double.pi / 2);
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataPointSpacing
    }
}

/// 获取数据源
extension KScrollGraphaView: ScrollableGraphViewDataSource {
    
    func label(atIndex pointIndex: Int) -> String {
        return "\(pointIndex + 1)"
    }
    func numberOfPoints() -> Int {
        return xPoints.count
    }
    func pointsArray() -> [GraphPoint] {
        return xPoints
    }
    /// 计算X轴各个文本的坐标
    func makePoints() -> [GraphPoint] {
        let startPoint = GraphPoint(position: CGPoint(x: 330 - 20, y: 0))
        let middlePoint1 = GraphPoint(position: CGPoint(x: 330 - 20, y: 100))
        let middlePoint2 = GraphPoint(position: CGPoint(x: 330 - 20, y: 200))
        let middlePoint3 = GraphPoint(position: CGPoint(x: 330 - 20, y: 300))
        let middlePoint4 = GraphPoint(position: CGPoint(x: 330 - 20, y: 400))
        let middlePoint5 = GraphPoint(position: CGPoint(x: 330 - 20, y: 500))
        let middlePoint6 = GraphPoint(position: CGPoint(x: 330 - 20, y: 600))
        let middlePoint7 = GraphPoint(position: CGPoint(x: 330 - 20, y: 700))
        let middlePoint8 = GraphPoint(position: CGPoint(x: 330 - 20, y: 800))
        let endPoint = GraphPoint(position: CGPoint(x: 330 - 20, y: 900))
        let points = [startPoint, middlePoint1, middlePoint2, middlePoint3, middlePoint4, middlePoint5, middlePoint6, middlePoint7, middlePoint8, endPoint]
        return points
    }
}
