//
//  TBSearchBarView.swift
//  Components
//
//  Created by Matías Contreras on 28-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import UIKit

public class TBSearchBarView: UIView {
    
    let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .blue
        label.text = "Hello World"
        return label
    }()
    
    public init() {
        super.init(frame: .zero)
        self.backgroundColor = .red
        buildUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}

extension TBSearchBarView: ViewCodable {
    public func buildViewHierarchy() {
        addSubview(label)
    }
    
    public func addConstraints() {
        label.layout.applyConstraint { view in
            view.inset(to: self)
        }
    }
}
