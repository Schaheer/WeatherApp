//
//  UICollectionView+WA.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import UIKit

extension UICollectionViewCell {
    /**
     Register cell with UITableView.
     
     - parameter tableView: UITableView to register Cell with.
     
     - returns: void.
     */
    class public func registerReusableCell(with collectionView :UICollectionView?) {
        collectionView?.register(UINib(nibName: self.cellIdentifier(), bundle: Bundle.main), forCellWithReuseIdentifier: self.cellIdentifier())
    }
    
    /**
     Will return class name as string.
     - returns: name of 'self' as string.
     */
    class public func cellIdentifier() -> String {
        return String(describing: self)
    }
    
}

extension UICollectionReusableView {
    /**
     Register cell with UITableView.
     
     - parameter tableView: UITableView to register Cell with.
     
     - returns: void.
     */
    class public func registerReusableView(with collectionView :UICollectionView?, forSupplementaryViewOfKind viewKind:String =  UICollectionView.elementKindSectionHeader) {
        
        collectionView?.register(UINib(nibName: self.viewIdentifier(), bundle: Bundle.main),
                                 forSupplementaryViewOfKind: viewKind,
                                 withReuseIdentifier: self.viewIdentifier())
    }
    
    /**
     Will return class name as string.
     - returns: name of 'self' as string.
     */
    class public func viewIdentifier() -> String {
        return String(describing: self)
    }
    
}
