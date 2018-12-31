//
//  RoundedShadowButton.swift
//  RoundedButton
//
//  Created by Shantaram Kokate on 12/27/18.
//  Copyright © 2018 Shantaram Kokate. All rights reserved.
//

import UIKit

class RoundedShadowButton: UIButton {
 
    var originalFrame: CGRect?
    func setupView() {
        
        originalFrame = self.frame

        self.layer.cornerRadius =   0.5
        self.layer.shadowRadius =   10.0
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize.zero
    }
    
    func animateButton(shouldLoad: Bool, withMessage message: String) {
        
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityView.startAnimating()
        activityView.color = .red
        activityView.hidesWhenStopped = true
        activityView.isUserInteractionEnabled = false
        activityView.tag = 1
        if shouldLoad {
            self.isUserInteractionEnabled = false
            self.layoutIfNeeded()
            self.setTitle("", for: .normal)
            UIView.animate(withDuration: 0.2, animations: {
                self.layer.cornerRadius = self.frame.height / 2
                self.frame = CGRect(x: self.frame.midX - (self.frame.height / 2), y: self.frame.origin.y, width: self.frame.height, height: self.frame.height)
                self.layoutIfNeeded()

            }) { (finished) in
                if finished {
                    self.isUserInteractionEnabled = true
                    self.addSubview(activityView)
                    activityView.center = CGPoint(x: self.frame.width / 2, y: self.frame.width / 2)
                    self.layoutIfNeeded()
                }
            }
        } else {
            for view in self.subviews where view.tag == 1 {
                view.removeFromSuperview()
            }
            self.layer.cornerRadius = 2
            self.setTitle("Request", for: .normal)
            activityView.removeFromSuperview()
            self.frame = originalFrame!
        }
    }

}
