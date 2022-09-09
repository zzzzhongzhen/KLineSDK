//
//  Cylinder.swift
//  KLineSDK
//
//  Created by vino on 2022/9/8.
//  阴线阳线绘制

import Foundation

class CylinderDrawingLayer: ScrollableGraphViewDrawingLayer {
    
    private var lineStyle: ScrollableGraphViewLineStyle
    private var lineCurviness: CGFloat

    init(frame: CGRect, lineWidth: CGFloat, lineColor: UIColor, lineStyle: ScrollableGraphViewLineStyle, shouldFill: Bool, lineCurviness: CGFloat) {

        self.lineStyle = lineStyle
        self.lineCurviness = lineCurviness
        
        super.init(viewportWidth: frame.size.width, viewportHeight: frame.size.height)
        
        self.lineWidth = lineWidth
        self.strokeColor = lineColor.cgColor
        
        self.lineJoin = CAShapeLayerLineJoin.bevel
        self.lineCap = CAShapeLayerLineCap.round

        // Setup
        self.fillColor = UIColor.clear.cgColor 
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
