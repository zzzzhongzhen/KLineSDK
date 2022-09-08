//
//  KLineCell.swift
//  KLineSDK
//
//  Created by vino on 2022/9/8.
//

import Foundation
import UIKit

class KLineCell: UITableViewCell {
    
    struct KLineData {
        let negative: Bool = false
        let openPrice: Double
        let closePrice: Double
        let maxPrice: Double
        let minPrice: Double
    }
    var content: CALayer = CALayer()
    let lab = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        lab.text = "dsada"
        lab.frame = CGRect(x: 0, y: 10, width: 100, height: 20)
        lab.textColor = UIColor.red
        self.addSubview(lab)
        layer.addSublayer(content)
    }
}
