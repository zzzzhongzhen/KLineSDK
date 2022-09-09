//
//  GraphPoint.swift
//  KLineSDK
//
//  Created by vino on 2022/9/9.
//

import Foundation


internal class GraphPoint: Copyable {
    
    typealias T = GraphPoint
    func copyable() -> GraphPoint {
        let g = GraphPoint(position: self.location)
        g.currentlyAnimatingToPosition = currentlyAnimatingToPosition
        return g
    }
    
    var location = CGPoint(x: 0, y: 0)
    var currentlyAnimatingToPosition = false
    
    var x: CGFloat {
        get {
            return location.x
        }
        set {
            location.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return location.y
        }
        set {
            location.y = newValue
        }
    }
    
    init(position: CGPoint = CGPoint.zero) {
        x = position.x
        y = position.y
    }
}
