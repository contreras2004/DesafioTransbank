//
//  UIView+ext.swift
//  DesafioTransbankTests
//
//  Created by Matías Contreras on 01-09-20.
//  Copyright © 2020 matias. All rights reserved.
//

import UIKit
import SketchKit

extension UIView {

    @discardableResult
    func withDynamicHeight(with width: CGFloat = UIScreen.main.bounds.width) -> Self {
        layout.applyConstraint { $0.widthAnchor(equalTo: width) }
        return self
    }

    @discardableResult
    func fullscreen() -> Self {
        frame = UIScreen.main.bounds
        return self
    }

    @discardableResult
    func setFrame(height: CGFloat, width: CGFloat = UIScreen.main.bounds.width) -> Self {
        frame = CGRect(x: 0, y: 0, width: width, height: height)
        return self
    }
}
