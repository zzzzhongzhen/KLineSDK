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

    lazy var graphaTableView: UITableView = {
        let tab = UITableView.init(frame: CGRect.zero, style: UITableView.Style.plain)
        tab.separatorColor = UIColor.clear
        tab.register(KLineCell.self, forCellReuseIdentifier: "KLineCell")
        tab.backgroundColor = UIColor.green
        return tab
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
     
        self.backgroundColor = UIColor.black
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        self.addSubview(graphaTableView)
        graphaTableView.delegate = self
        graphaTableView.dataSource = self
    }
    open override func layoutSubviews() {
        super.layoutSubviews()
        graphaTableView.frame = CGRect(x: 0, y: 20, width: self.width - 60, height: self.width)
        graphaTableView.transform = CGAffineTransform(rotationAngle: Double.pi / 2);
        graphaTableView.center = self.center
    }
}
extension KScrollGraphaView: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 200
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: KLineCell = tableView.dequeueReusableCell(withIdentifier: "KLineCell") as! KLineCell
//        cell.contentView.transform = CGAffineTransform(rotationAngle: Double.pi / 2);
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataPointSpacing
    }
}
