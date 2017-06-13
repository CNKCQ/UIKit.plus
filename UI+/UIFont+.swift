//
//  UIFont+.swift
//  Elegant
//
//  Created by Steve on 2017/5/22.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit


// MARK: - convenience initializer declaration
extension UIFont {

    convenience init?(_ size: CGFloat) {
        self.init(name: "HelveticaNeue", size: size)
    }
}

// MARK: -  System fonts
extension UIFont {

    public class var labelFont: UIFont {
        return systemFont(ofSize: labelFontSize)
    }

    public class var buttonFont: UIFont {
        return systemFont(ofSize: buttonFontSize)
    }

    public class var smallSystemFont: UIFont {
        return systemFont(ofSize: smallSystemFontSize)
    }

    public class var systemFont: UIFont {
        return systemFont(ofSize: systemFontSize)
    }
}

extension UIFont {

    /// Returns a bolded version of `self`.
    public var bolded: UIFont {
        return fontDescriptor.withSymbolicTraits(.traitBold)
            .map { UIFont(descriptor: $0, size: 0.0) } ?? self
    }

    /// Returns a italicized version of `self`.
    public var italicized: UIFont {
        return fontDescriptor.withSymbolicTraits(.traitItalic)
            .map { UIFont(descriptor: $0, size: 0.0) } ?? self
    }
}
