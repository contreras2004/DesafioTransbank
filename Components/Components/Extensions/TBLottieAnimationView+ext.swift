//
//  TBLottieAnimationView+ext.swift
//  Components
//
//  Created by Matías Contreras on 31-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import UIKit

extension UIView {

    enum AssociatedKey {
        static var animation: UInt = 0
    }

    private(set) var animation: TBLottieAnimationView? {
        get {
            objc_getAssociatedObject(self, &AssociatedKey.animation) as? TBLottieAnimationView
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.animation, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    public func addAnimation(viewModel: TBLottieAnimationViewModel) {
        if self.animation?.viewModel == viewModel {
            return
        }
        removeAnimation()
        let animationView = TBLottieAnimationView(viewModel: viewModel)
        self.animation = animationView
        self.addSubview(animationView)
        animationView.layout.applyConstraint { view in
            view.inset(to: self)
        }
    }

    public func removeAnimation() {
        guard let animation = self.animation else { return }
        animation.removeFromSuperview()
    }
}
