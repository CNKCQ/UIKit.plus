//
//  Object+.swift
//  Elegant
//
//  Created by Steve on 2017/6/29.
//  Copyright © 2017年 KingCQ. All rights reserved.
//
//  See: https://stackoverflow.com/questions/25426780/how-to-have-stored-properties-in-swift-the-same-way-i-had-on-objective-c

import UIKit

public final class ObjectAssociation<T: AnyObject> {

    private let policy: objc_AssociationPolicy

    /// - Parameter policy: An association policy that will be used when linking objects.
    public init(policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
        self.policy = policy
    }

    /// Accesses associated object.
    /// - Parameter index: An object whose associated object is to be accessed.
    public subscript(index: AnyObject) -> T? {

        get { return objc_getAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque()) as! T? }
        set { objc_setAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque(), newValue, policy) }
    }
}

extension UINavigationController {

    private static let association = ObjectAssociation<NSObject>()
    var simulatedProperty: NSObject? {
        get { return UINavigationController.association[self] }
        set { UINavigationController.association[self] = newValue }
    }
}


