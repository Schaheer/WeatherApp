//
//  UITableView+WA.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import UIKit

extension UITableView {
    
    ///Hides Default Sperator of UITableView
    func hideDefaultSeprator() {
        self.separatorColor = UIColor.clear
        self.separatorStyle = .none
    }
    
    ///Scrools to First row of UITableView
    func scrollToFirstRow() {
        let indexPath = IndexPath(row: 0, section: 0)
        scrollToIndexPath(indexPath)
    }
    
    /**
     Scrools to specific index of UITableView.
     
     - parameter indexPath: Index on whic you want to scrool.
     
     - returns: void.
     */
    func scrollToIndexPath(_ indexPath : IndexPath) {
        if self.hasRow(at: indexPath) {
            self.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    /**
     Check wheter UITableView has a row at specif index.
     
     - parameter at indexPath: Index on whic you want to check.
     
     - returns: Bool.
     */
    func hasRow(at indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
    
    ///Deque cell of a UITableView
    func dequeueReusableCell<T: UITableViewCell>() -> T? {
        return dequeueReusableCell(forIndexPath: nil)
    }
    
    /**
     Deque cell of a UITableView for index path.
     
     - parameter forIndexPath: Index path for dequing cell.
     
     - returns: void.
     */
    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath?) -> T? {
        
        if let myCell: T = self.dequeueReusableCell(indexPath) {
            return myCell
            
        } else {
            
            self.register(UINib(nibName: T.self.cellIdentifier(), bundle: Bundle.main), forCellReuseIdentifier: T.self.cellIdentifier())
            
            if let myCell: T = self.dequeueReusableCell(indexPath) {
                return myCell
                
            } else {
                return nil
            }
        }
    }
    
    /**
     Deque cell of a UITableView for index path.
     
     - parameter forIndexPath: Index path for dequing cell.
     
     - returns: void.
     */
    private func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath?) -> T? {
        
        if let myIndexPath = indexPath {
            
            if let cell = self.dequeueReusableCell(withIdentifier: T.self.cellIdentifier(), for: myIndexPath) as? T {
                return cell
            } else {
                return nil
            }
        } else {
            
            if let cell = self.dequeueReusableCell(withIdentifier: T.self.cellIdentifier()) as? T {
                return cell
            } else {
                return nil
            }
        }
    }
    
    /**
     Deque Header of a UITableView for index path.
     
     - returns: void.
     */
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? {
        
        if let myCell: T = self.dequeueReusableTableViewHeaderFooterView() {
            return myCell
            
        } else {
            
            self.register(UINib(nibName: T.self.viewIdentifier(), bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: T.self.viewIdentifier())
            
            if let myCell: T = self.dequeueReusableTableViewHeaderFooterView() {
                return myCell
                
            } else {
                return T()
            }
        }
    }
    
    /**
     Deque Header of a UITableView for index path.
     
     - returns: void.
     */
    private func dequeueReusableTableViewHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? {
        
        if let cell = self.dequeueReusableHeaderFooterView(withIdentifier: T.self.viewIdentifier()) as? T {
            return cell
        } else {
            return nil
        }
    }
    
    /**
     Retruns index set of all visible sections.
     
     - returns: IndexSet.
     */
    func visibleSection() -> IndexSet {
        
        var indexSet: IndexSet = IndexSet()
        let visibleRect: CGRect = self.bounds
        
        for sectionIndex in 0..<self.numberOfSections {
            
            let sectionBounds = self.rect(forSection: sectionIndex)
            
            if sectionBounds.intersects(visibleRect) {
                
                indexSet.insert(sectionIndex)
            }
        }
        return indexSet
    }
    
    /**
     Retruns Last visible section number.
     
     - returns: Int.
     */
    func lastVisibleSection() -> Int {
        
        let visibleIndexSet = self.visibleSection()
        
        if let lastSection = visibleIndexSet.last {
            
            return lastSection + 1
            
        } else {
            return 0
        }
    }
    
    /**
     Retruns Last visible row number.
     
     - returns: Int.
     */
    func lastVisibleRow() -> Int {
        
        if let lastvisibleCell = self.visibleCells.last {
            
            if let lastvisibleCellIndexPath = self.indexPath(for: lastvisibleCell) {
                
                return lastvisibleCellIndexPath.row + 1
            }
            
        }
        return 0
    }
    
}

extension UITableViewCell {
    /**
     Register cell with UITableView.
     
     - parameter tableView: UITableView to register Cell with.
     
     - returns: void.
     */
    class public func registerReusableCell(with tableView :UITableView?) {
        tableView?.register(UINib(nibName: self.cellIdentifier(), bundle: Bundle.main), forCellReuseIdentifier: self.cellIdentifier())
    }
    
    /**
     Will return class name as string.
     - returns: name of 'self' as string.
     */
    class public func cellIdentifier() -> String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView {
    /**
     Register Header/Footer View with UITableView.
     
     - parameter tableView: UITableView to register Header/Footer View with.
     
     - returns: void.
     */
    class public func registerReusableHeaderView(with tableView :UITableView?) {
        tableView?.register(UINib(nibName: self.viewIdentifier(), bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: self.viewIdentifier())
    }
    
    /**
     Will return class name as string.
     - returns: name of 'self' as string.
     */
    class public func viewIdentifier() -> String {
        return String(describing: self)
    }
}

