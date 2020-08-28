//
//  ViewCodableProtocol.swift
//  Components
//
//  Created by Matías Contreras on 28-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import Foundation

public protocol ViewCodable {
    func buildViewHierarchy()
    func addConstraints()
    func customizeView()

    func buildUI()
}

public extension ViewCodable {
    func buildUI() {
        buildViewHierarchy()
        addConstraints()
        customizeView()
    }

    func customizeView() { }
}
