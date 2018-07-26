//
//  DCCJNavigator.swift
//  DCCJNavigator
//
//  Created by 龚欢 on 2018/7/26.
//

import Foundation

public protocol DCCJNavigator {
    associatedtype Destination
    
    func navigator(to destination: Destination)
    func present(to destination: Destination, from vc: UIViewController)
    func open(url: String)
}

public extension DCCJNavigator {
    func present(to destination: Destination, from vc: UIViewController) {}
    
    func open(url: String) {
        guard let u = URL(string: url) else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(u, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(u)
        }
    }
}
