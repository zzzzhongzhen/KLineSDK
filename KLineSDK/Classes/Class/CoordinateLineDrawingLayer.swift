//
//  CoordinateLineDrawingLayer.swift
//  KLineSDK
//
//  Created by vino on 2022/9/12.
//

import UIKit

class CoordinateLineDrawingLayer: ScrollableGraphViewDrawingLayer {

    private var lineStyle: ScrollableGraphViewLineStyle
    private var currentLinePath = UIBezierPath()
    private var dataSource: ScrollableGraphViewDataSource

    init(dataSource: ScrollableGraphViewDataSource, viewPort: CGSize, lineStyle: ScrollableGraphViewLineStyle) {

        self.lineStyle = lineStyle
        self.dataSource = dataSource
        super.init(viewportWidth: viewPort.width, viewportHeight: viewPort.height)
        
        self.strokeColor = UIColor.black.cgColor
        self.lineJoin = CAShapeLayerLineJoin.bevel
        self.lineCap = CAShapeLayerLineCap.square
        self.fillColor = UIColor.red.cgColor
        self.lineWidth = 1
        
        self.createLinePath()
    }
    func makeRectangle() {

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func createLinePath() {
        
        let points = dataSource.pointsArray()
        guard points.count > 1 else {
            return
        }
//        currentLinePath.move(to: points.first!.location)
//        currentLinePath.addLine(to: points.last!.location)
//        self.path = currentLinePath.cgPath
        
        for i in 0...dataSource.numberOfPoints()-1 {
            let labelStr = dataSource.label(atIndex: i)
            let point = points[safe: i]
            let labelLayer = CATextLayer()
            labelLayer.frame = CGRect(x: point?.x ?? 0, y: point?.y ?? 0, width: 30, height: 20)
            labelLayer.string = labelStr
            labelLayer.fontSize = 12
            labelLayer.foregroundColor = UIColor.black.cgColor
            labelLayer.setAffineTransform(CGAffineTransform(rotationAngle: -Double.pi / 2))
            self.addSublayer(labelLayer)
        }
    }
}
