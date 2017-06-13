//
//  UICollectionView+.swift
//  Elegant
//
//  Created by Steve on 2017/5/24.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

extension UICollectionView {

    /// Returns the items of the collectionView
    public var numberOfItems: Int {
        return (0 ..< numberOfSections).reduce(0) {
            $0 + numberOfItems(inSection: $1)
        }
    }
}

// MARK: Reusable support for UICollectionView

public extension UICollectionView {

    /**
     Register a Class-Based `UICollectionViewCell` subclass (conforming to `Reusable`)

     - parameter cellType: the `UICollectionViewCell` (`Reusable`-conforming) subclass to register

     - seealso: `register(_:,forCellWithReuseIdentifier:)`
     */
    final func registerReusableCell<T: UICollectionViewCell>(cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    /**
     Returns a reusable `UICollectionViewCell` object for the class inferred by the return-type

     - parameter indexPath: The index path specifying the location of the cell.
     - parameter cellType: The cell class to dequeue

     - returns: A `Reusable`, `UICollectionViewCell` instance

     - note: The `cellType` parameter can generally be omitted and infered by the return type,
     except when your type is in a variable and cannot be determined at compile time.
     - seealso: `dequeueReusableCellWithReuseIdentifier(_:,forIndexPath:)`
     */
    final func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Reusable {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the cell beforehand"
            )
        }
        return cell
    }

    /**
     Register a Class-Based `UICollectionReusableView` subclass (conforming to `Reusable`) as a Supplementary View

     - parameter elementKind: The kind of supplementary view to create.
     - parameter viewType: the `UIView` (`Reusable`-conforming) subclass to register as Supplementary View

     - seealso: `register(_:,forSupplementaryViewOfKind:,withReuseIdentifier:)`
     */
    final func registerReusableSupplementaryView<T: UICollectionReusableView>(elementKind: String, viewType: T.Type) where T: Reusable {
        register(viewType.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: viewType.reuseIdentifier)
    }

    /**
     Returns a reusable `UICollectionReusableView` object for the class inferred by the return-type

     - parameter elementKind: The kind of supplementary view to retrieve.
     - parameter indexPath:   The index path specifying the location of the cell.
     - parameter viewType: The view class to dequeue

     - returns: A `Reusable`, `UICollectionReusableView` instance

     - note: The `viewType` parameter can generally be omitted and infered by the return type,
     except when your type is in a variable and cannot be determined at compile time.
     - seealso: `dequeueReusableSupplementaryViewOfKind(_:,withReuseIdentifier:,forIndexPath:)`
     */
    final func dequeueReusableSupplementaryView<T: UICollectionReusableView>
    (elementKind: String, indexPath: IndexPath, viewType: T.Type = T.self) -> T where T: Reusable {
        let view = dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: viewType.reuseIdentifier, for: indexPath)
        guard let typedView = view as? T else {
            fatalError(
                "Failed to dequeue a supplementary view with identifier \(viewType.reuseIdentifier) matching type \(viewType.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the supplementary view beforehand"
            )
        }
        return typedView
    }
}
