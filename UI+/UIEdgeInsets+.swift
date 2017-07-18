//
//  UIEdgeInsets+.swift
//  Elegant
//
//  Created by Steve on 2017/6/29.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {

    init(all: CGFloat) {
        self.init(top: all, left: all, bottom: all, right: all)
    }

    init(topBottom: CGFloat, leftRight: CGFloat) {
        self.init(top: topBottom, left: leftRight, bottom: topBottom, right: leftRight)
    }

    init(topBottom: CGFloat) {
        self.init(top: topBottom, left: 0, bottom: topBottom, right: 0)
    }

    init(leftRight: CGFloat) {
        self.init(top: 0, left: leftRight, bottom: 0, right: leftRight)
    }

    init(left: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: 0)
    }

    init(bottom: CGFloat) {
        self.init(top: 0, left: 0, bottom: bottom, right: 0)
    }

    init(right: CGFloat) {
        self.init(top: 0, left: 0, bottom: 0, right: right)
    }

    init(top: CGFloat) {
        self.init(top: top, left: 0, bottom: 0, right: 0)
    }

    var topBottom: (CGFloat, CGFloat) {
        return (self.top, self.bottom)
    }
    
    var leftRight: (CGFloat, CGFloat) {
        return (self.left, self.right)
    }


}
