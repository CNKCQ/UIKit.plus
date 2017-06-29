//
//  UIImageView+.swift
//  Elegant
//
//  Created by Steve on 2017/5/22.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

public extension UIImageView {

    /// ImageView are created with an iamge witch is instance by a `String`
    convenience init?(imageNamed: String) {
        self.init(image: UIImage(named: imageNamed))
    }

    /// Set UIImageView with rounded corners for aspect fit mode
    func roundCornersForAspectFit(radius: CGFloat) {
        if let image = self.image {
            // calculate drawingRect
            let boundsScale = bounds.size.width / bounds.size.height
            let imageScale = image.size.width / image.size.height
            var drawingRect: CGRect = bounds
            if boundsScale > imageScale {
                drawingRect.size.width = drawingRect.size.height * imageScale
                drawingRect.origin.x = (bounds.size.width - drawingRect.size.width) / 2
            } else {
                drawingRect.size.height = drawingRect.size.width / imageScale
                drawingRect.origin.y = (bounds.size.height - drawingRect.size.height) / 2
            }
            let path = UIBezierPath(roundedRect: drawingRect, cornerRadius: radius)
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
}
