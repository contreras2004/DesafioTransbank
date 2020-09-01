//
//  PreviewMediaView.swift
//  Components
//
//  Created by Matías Contreras on 01-09-20.
//  Copyright © 2020 matias. All rights reserved.
//

import UIKit
import WebKit

public class PreviewMediaView: UIView {

    let url: URL?

    public init(url: URL?) {
        self.url = url
        super.init(frame: .zero)
        buildUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        return view
    }()

    lazy var songPreview: WKWebView = {
        let view = WKWebView(frame: .zero)
        if let url = self.url {
            view.load(URLRequest(url: url))
        }

        return view
    }()
}

extension PreviewMediaView: ViewCodable {
    public func buildViewHierarchy() {
        
    }

    public func addConstraints() {

    }
}
