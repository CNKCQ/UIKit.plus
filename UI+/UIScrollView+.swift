//
//  UIScrollView+.swift
//  Elegant
//
//  Created by Steve on 2017/5/24.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

public extension UIScrollView {

    /// `set` `get` the content's offsetX
    var offsetX: CGFloat {
        get {
            return contentOffset.x
        } set {
            contentOffset = CGPoint(x: newValue, y: contentOffset.y)
        }
    }

    /// `set` `get` the content's offsetY
    var offsetY: CGFloat {
        get {
            return contentOffset.y
        } set {
            contentOffset = CGPoint(x: contentOffset.x, y: newValue)
        }
    }

    /// `set` `get` the content's height
    var contentHeight: CGFloat {
        get {
            return contentSize.height
        } set {
            contentSize = CGSize(width: contentSize.width, height: newValue)
        }
    }

    /// `set` `get` the content's width
    var contentWidth: CGFloat {
        get {
            return contentSize.height
        } set {
            contentSize = CGSize(width: newValue, height: contentSize.height)
        }
    }


    /// `set` `get` the contentInset's top
    var contentInsetTop: CGFloat {
        get {
            return contentInset.top
        } set {
            contentInset = UIEdgeInsets(top: newValue, left: contentInset.left, bottom: contentInset.bottom, right: contentInset.right)
        }
    }

    /// `set` `get` the contentInset's bottom
    var contentInsetBottom: CGFloat {
        get {
            return contentInset.bottom
        } set {
            contentInset = UIEdgeInsets(top: contentInset.top, left: contentInset.left, bottom: newValue, right: contentInset.right)
        }
    }

    /// `set` `get` the contentInset's left
    var contentInsetLeft: CGFloat {
        get {
            return contentInset.left
        } set {
            contentInset = UIEdgeInsets(top: contentInset.top, left: newValue, bottom: contentInset.bottom, right: contentInset.right)
        }
    }

    /// `set` `get` the contentInset's top
    var contentInsetRight: CGFloat {
        get {
            return contentInset.right
        } set {
            contentInset = UIEdgeInsets(top: top, left: contentInset.left, bottom: contentInset.bottom, right: newValue)
        }
    }

}
