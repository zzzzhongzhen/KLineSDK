//
//  ViewController.swift
//  KLineSDK
//
//  Created by ZhongZhen on 09/07/2022.
//  Copyright (c) 2022 ZhongZhen. All rights reserved.
//

import UIKit
import KLineSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let scr = KScrollGraphaView()
        scr.frame = CGRect(x: 0, y: 100, width: C.Screen.width, height: 400)
        self.view.addSubview(scr)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

