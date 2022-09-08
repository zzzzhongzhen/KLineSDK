//
//  Constants.swift
//  CoinExchange_iOS
//
//  Created by vino on 2022/9/8.
//  存放常量

import UIKit

public enum C {
    public enum Screen {
        public static let bounds = UIScreen.main.bounds
        public static let width = UIScreen.main.bounds.size.width
        public static let height = UIScreen.main.bounds.size.height

        static let widthRatio = width / 375.0
        static let heightRatio = height / 667.0
        
        static let statusBarHeight = UIApplication.shared.statusBarFrame.height
        static let navBarHeight = 44 + statusBarHeight

        static var safeAreaInsetsTop: CGFloat {
            UIApplication.shared.keyWindow?.safeAreaInsets.top ?? statusBarHeight
        }

        static var safeAreaInsetsBottom: CGFloat {
            UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        }
    }
}


extension C {
    enum DateFormat {
        static let yMdHms = "yyyy-MM-dd HH:mm:ss"
        static let yM = "yyyy-MM"
    }
}
