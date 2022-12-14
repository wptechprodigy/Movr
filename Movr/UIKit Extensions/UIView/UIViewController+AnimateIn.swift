//
//  UIViewController+AnimateIn.swift
//  Movr
//
//  Created by waheedCodes on 24/12/2022.
//

import UIKit

extension UIViewController {
    
    /// Reveals the view with some animation for number seconds desired
    /// - Parameters:
    ///   - view: view to reveal after some time interval
    ///   - seconds: amount of time to reveal the view
    internal func showWithAnimation(view: UIView,
                                    for seconds: CGFloat,
                                    completion: ((Bool) -> Void)? = nil
    ) {
        UIView.animate(withDuration: seconds, animations: {
            view.alpha = 1
        }, completion: completion)
    }
}
