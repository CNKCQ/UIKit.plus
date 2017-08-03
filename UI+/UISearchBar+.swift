//
//  UISearchBar+.swift
//  Elegant
//
//  Created by Steve on 2017/8/3.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

extension UISearchBar {

    /// custom `self` cursor's appearance
    ///
    /// - Parameter color: specified color for cursor
    var cursorColor: UIColor {
        get {
            if #available(iOS 9.0, *) {
                return UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor
            } else {
                return textField?.tintColor ?? tintColor
            }

        }
        set {
            if #available(iOS 9.0, *) {
                UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = newValue
            } else {
                textField?.tintColor = newValue
            }

        }
    }

    /// the textField of `self`
    var textField: UITextField? {
        return self.flatSubviews.filter({$0 .isKind(of: UITextField.self)}).first as? UITextField
    }
}
