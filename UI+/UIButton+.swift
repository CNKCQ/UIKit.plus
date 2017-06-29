//
//  UIButton+.swift
//  Elegant
//
//  Created by Steve on 2017/5/22.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

public extension UIButton {

    /// You can set the background image to use for each state.
    func setBackgroundColor(_ color: UIColor, for state: UIControlState) {
        self.setBackgroundImage(.pixel(of: color), for: state)
    }

}
