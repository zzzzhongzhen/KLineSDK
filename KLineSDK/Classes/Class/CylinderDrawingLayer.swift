//
//  Cylinder.swift
//  KLineSDK
//
//  Created by vino on 2022/9/8.
//  阴线阳线绘制

import Foundation
import UIKit

internal protocol ScrollableGraphViewDataSource : AnyObject {
    func label(atIndex pointIndex: Int) -> String
    func numberOfPoints() -> Int
    func pointsArray() -> [GraphPoint]
}

class CylinderDrawingLayer: ScrollableGraphViewDrawingLayer {
    
    private var lineStyle: ScrollableGraphViewLineStyle
    private var currentLinePath = UIBezierPath()
    private var dataSource: ScrollableGraphViewDataSource
    private var rectangleLayer: CAShapeLayer = CAShapeLayer()

    init(dataSource: ScrollableGraphViewDataSource, viewPort: CGSize, negative: Bool, lineStyle: ScrollableGraphViewLineStyle) {

        self.lineStyle = lineStyle
        self.dataSource = dataSource
        super.init(viewportWidth: viewPort.width, viewportHeight: viewPort.height)
        
        self.strokeColor = negative ? UIColor.green.cgColor : UIColor.red.cgColor
        self.lineJoin = CAShapeLayerLineJoin.bevel
        self.lineCap = CAShapeLayerLineCap.square
        self.fillColor = UIColor.clear.cgColor
        self.lineWidth = 1
        
        rectangleLayer.lineWidth = 10
        rectangleLayer.lineJoin = CAShapeLayerLineJoin.bevel
        rectangleLayer.lineCap = CAShapeLayerLineCap.square
        rectangleLayer.strokeColor = negative ? UIColor.green.cgColor : UIColor.red.cgColor
        rectangleLayer.fillColor = UIColor.clear.cgColor

        self.addSublayer(rectangleLayer)
        self.createLinePath()
    }
    func makeRectangle() {

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func createLinePath() {
        
        let points = dataSource.pointsArray()
        guard points.count > 3 else {
            return
        }
        currentLinePath.move(to: points.first!.location)
        currentLinePath.addLine(to: points[1].location)
        currentLinePath.move(to: points[2].location)
        currentLinePath.addLine(to: points.last!.location)
        self.path = currentLinePath.cgPath
        
        let subPath = UIBezierPath()
        subPath.move(to: points[1].location)
        subPath.addLine(to: points[2].location)
        self.rectangleLayer.path = subPath.cgPath
    }
}
