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
        backgroundColor = .darkGray
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Reproducir Preview", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.addTarget(self, action: Selector(("play")), for: .touchUpInside)
        return view
    }()

    lazy var songPreview: WKWebView = {
        let view = WKWebView(frame: .zero)
        view.isOpaque = false
        view.backgroundColor = .darkGray
        return view
    }()

    @objc
    public func play() {
        //we should add a loading indicator here...
        self.button.isHidden = true
        if let url = self.url {
            songPreview.load(URLRequest(url: url))
        }
    }

    public func stop() {
        songPreview.stopLoading()
    }
}

extension PreviewMediaView: ViewCodable {
    public func buildViewHierarchy() {

        addSubview(songPreview)
        addSubview(button)
    }

    public func addConstraints() {
        songPreview.layout.applyConstraint { view in
            view.inset(to: self)
        }

        button.layout.applyConstraint { view in
            view.inset(to: self, withInset: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
        }
    }
}
