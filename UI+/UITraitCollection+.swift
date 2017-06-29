//
//  UITraitCollection+.swift
//  Elegant
//
//  Created by Steve on 2017/6/29.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

extension UITraitCollection {
    /// Returns true if the trait collection is both horizontally and vertically regular.
    public var isRegularRegular: Bool {
        return self.horizontalSizeClass == .regular && self.verticalSizeClass == .regular
    }

    /// Returns true if the trait collection is vertically compact.
    public var isVerticallyCompact: Bool {
        return self.verticalSizeClass == .compact
    }
}
