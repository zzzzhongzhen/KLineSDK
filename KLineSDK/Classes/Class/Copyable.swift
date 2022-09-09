//
//  Copyable.swift
//  KLineSDK
//
//  Created by vino on 2022/9/9.
//

import Foundation

protocol Copyable {
    
    associatedtype T: Copyable
    
    func copyable() -> T
}

//extension Array : Copyable where Element: Copyable {
//    typealias T = Array
//
//    func copyable() -> T {
//        var copiedArray = Array()
//        for element in self {
//            let e = element.copyable()
//            copiedArray.append(e)
//        }
//        return copiedArray
//    }
//}
