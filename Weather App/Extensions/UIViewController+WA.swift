//
//  UIViewController+WA.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import UIKit

extension UIViewController {
    
    //MARK: -  Properties
    var MainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    //MARK: -  Functions
    
    /**
     Presents ViewController with animation.
     
     - parameter viewControllerToPresent: ViewController to present.
     - parameter animated: With animation or not.
     - parameter modalTransitionStyle: Presentation style. Bydefault its 'coverVertical'.
     
     - returns: void.
     */
    open func presentPOPUP(_ viewControllerToPresent: UIViewController, animated flag: Bool, modalTransitionStyle:UIModalTransitionStyle = .coverVertical, completion: (() -> Swift.Void)? = nil) {
        DispatchQueue.main.async {
            viewControllerToPresent.modalPresentationStyle = .overCurrentContext
            viewControllerToPresent.modalTransitionStyle = modalTransitionStyle
            
            self.present(viewControllerToPresent, animated: flag, completion: completion)
        }
        
    }
    
}

extension UIViewController {
    
    /**
     Initialize a nib.
     
     
     - returns: UIViewController.
     */
    public class func fromNib<T>() -> T? where T : UIViewController {
        return fromNib(nibName: nil)
    }
    
    /**
     Initialize a nib.
     
     - parameter nibName: Nib name.
     
     - returns: UIViewController.
     */
    public class func fromNib<T>(nibName: String?) -> T? where T : UIViewController {
        
        let name = nibName ?? String(describing: self)
        return self.init(nibName: name, bundle: Bundle.main) as? T
    }
    
    /**
     Initialize a UIViewController from Storyboard.
     
     
     - returns: UIViewController.
     */
    class func instantiateVCFromMainStoryboard<T>() -> T? where T : UIViewController {
        return instantiateMainContoller()
    }
    
    /**
     Initialize a UIViewController from Storyboard.
     
     
     - returns: UIViewController.
     */
    fileprivate class func instantiateMainContoller<T>() -> T? where T : UIViewController  {
        return UIViewController().MainStoryBoard.instantiateViewController(withIdentifier: String(describing: self)) as? T
    }
    
}

extension UIViewController {
    
    ///Show activity indicator with or without animation.
    open func showActivityIndicator(withAnimation isEnable: Bool = false) {
        WAActivityIndicator.shared.showActivityIndicator(withAnimation: isEnable)
        
    }
    
    ///Hide activity indicator with or without animation.
    open func hideActivityIndicator(withAnimation isEnable: Bool = false) {
        WAActivityIndicator.shared.hideActivityIndicator(withAnimation: isEnable)
    }
    
    ///Hide all activity indicators..
    open func removeAllActivityIndicator(){
        WAActivityIndicator.shared.removeAllActivityIndicator()
    }
}

extension UIViewController {
    
    
    
}
