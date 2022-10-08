//
//  WAActivityIndicator.swift
//  Suuq Online
//
//  Created by Schaheer Saleem on 14/03/2022.
//

import UIKit

final class WAActivityIndicator {
    
    enum LoaderType {
        case gif
        case activityIndicator
    }
    
    // MARK:- Shared Instance
    static let shared = WAActivityIndicator()
    
    // MARK:- Properties
    private var container: UIView = UIView()
    private var loadingView: UIView = UIView()
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private let containerViewTag = 92119211
    
    private var imageView: UIImageView = UIImageView()
    private var gifName: String = ""
    private var loaderType :LoaderType = LoaderType.activityIndicator
    
    private var loaderCount = 0
    
    // MARK:- Constructor
    private init() {
        
        container.tag = self.containerViewTag
        container.frame = UIScreen.main.bounds
        container.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        container.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        if loaderType == .activityIndicator {

            loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            loadingView.center = container.center
            loadingView.backgroundColor = UIColor.black
            loadingView.clipsToBounds = false
            loadingView.layer.cornerRadius = 10
            
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40);
            activityIndicator.style = UIActivityIndicatorView.Style.large
            activityIndicator.color = .white
            activityIndicator.center = CGPoint(x:loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
            
            loadingView.addSubview(activityIndicator)
            container.addSubview(loadingView)
            
        } else {
            imageView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
            imageView.center = container.center
//            imageView.loadGif(name: gifName)
            
            container.addSubview(imageView)
            
        }
    }

    /**
      Show customized activity indicator.
     /
     - parameter withAnimation: show with animation or not. Bydefault it's true.
     
     - returns: void.
     */
    func showActivityIndicator(withAnimation : Bool = false) {
        
        if let window = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window {
            
            loaderCount = loaderCount + 1
            
            if window.viewWithTag(self.containerViewTag) == nil {
                window.addSubview(container)
            }
            
            window.bringSubviewToFront(container)
            
            if(withAnimation) {
                self.container.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                self.container.alpha = 1
                
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 4, options: .curveEaseInOut, animations: {
                    
                    self.container.transform = .identity
                    
                }, completion:nil)
            
            } else {
                
                self.container.alpha = 1
                self.container.transform = .identity
            }
            
            self.activityIndicator.startAnimating()
        }
    }
    
    
    /**
      Hide activity indicator.
     
     - parameter withAnimation: Hide with animation or not. Bydefault it's true.
     
     - returns: void.
     */
    func hideActivityIndicator(withAnimation : Bool = true) {
        
        self.loaderCount = loaderCount - 1
        
        if (loaderCount <= 0) {
            self.loaderCount = 0
            
            
            if(withAnimation && false) { //With Animation
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 8, options: .curveEaseIn, animations: {
                    self.container.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                    self.container.alpha = 0
                    
                }, completion: { (isCompleted) in
                    
                    if isCompleted {
                        self.activityIndicator.stopAnimating()
                        self.container.removeFromSuperview()
                        self.container.transform = .identity
                    }
                })
            
            } else { // WithOut Animation
                self.container.alpha = 0
                self.activityIndicator.stopAnimating()
                self.container.removeFromSuperview()
            }
        }
    }
    
    /**
     Hide all activity indicators.
     
     - returns: void.
     */
    func removeAllActivityIndicator() {
        
        self.loaderCount = 0
        self.hideActivityIndicator()
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.subviews.forEach({ (aView) in
            
            // If found in window subview then remove
            if aView.tag == self.containerViewTag {
                
                if let activityIndicator = (aView.subviews.first ?? UIView()).subviews.first as? UIActivityIndicatorView {
                    activityIndicator.stopAnimating()
                }
                aView.removeFromSuperview()
            }
        })
    }
}
