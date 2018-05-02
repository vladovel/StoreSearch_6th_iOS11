//
//  DimmingPresentationController.swift
//  StoreSearch_6th_iOS11
//
//  Created by Vlado Velkovski on 4/26/18.
//  Copyright © 2018 Vlado Velkovski. All rights reserved.
//

import UIKit

class DimmingPresentationController: UIPresentationController {
    
    lazy var dimmingView = GradientView(frame: CGRect.zero)
    
    override func presentationTransitionWillBegin() {
        dimmingView.frame = containerView!.bounds
        containerView!.insertSubview(dimmingView, at: 0)
        dimmingView.alpha = 0
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 1
            }, completion: nil)
        }
    }
    
    override func dismissalTransitionWillBegin() {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0}, completion: nil)
        }
    }
    
    override var shouldRemovePresentersView: Bool {
        return false
    }
}
