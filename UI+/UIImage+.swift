//
//  UIImage+.swift
//  Elegant
//
//  Created by Steve on 2017/5/22.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

public extension UIImage {

    /// Returns base64 string
    var base64: String? {
        return UIImageJPEGRepresentation(self, 1.0)?.base64EncodedString()
    }

    /// Returns an image with the radius you give
    ///
    /// - Parameter radius: cornerRadius
    /// - Returns: an image
    func corner(radius: CGFloat) -> UIImage {
        let frame = CGRect(origin: .zero, size: CGSize(width: size.width, height: size.height))
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        UIBezierPath(roundedRect: frame, cornerRadius: radius).addClip()
        draw(in: frame)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndPDFContext()
        return image
    }

    /// Image are created with tintColor.
    /// - Parameter tintColor: UIColor
    /// - Returns: A new image
    @discardableResult
    class func image(with color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        UIGraphicsBeginImageContext(size)
        color.set()
        UIRectFill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

    /// A 1x1 UIImage of a solid color.
    ///
    /// - Parameter color: A color.
    /// - Returns: image
    public static func pixel(of color: UIColor) -> UIImage {
        let pixel = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(pixel.size)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
        context.setFillColor(color.cgColor)
        context.fill(pixel)
        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }
}
