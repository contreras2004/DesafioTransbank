//
//  TBLottieLoader.swift
//  Components
//
//  Created by Matías Contreras on 31-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import UIKit
import Lottie

public enum TBLottieAnimation: String {
    case loading
    case noConnection
    case genericError
    case noSearchResults
}

public struct TBLottieAnimationViewModel{
    let message: String
    let animation: TBLottieAnimation

    public init(message: String, animation: TBLottieAnimation) {
        self.message = message
        self.animation = animation
    }
}

public class TBLottieAnimationView: UIView {

    let viewModel: TBLottieAnimationViewModel

    lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.viewModel.message
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()

    lazy var lottieAnimation: AnimationView = {
        let animation = AnimationView(name: self.viewModel.animation.rawValue, bundle: Bundle(for: TBLottieAnimationView.self))
        animation.loopMode = .loop
        animation.contentMode = .scaleAspectFill
        animation.backgroundColor = .red
        return animation
    }()

    public init(viewModel: TBLottieAnimationViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildUI()
        lottieAnimation.play()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TBLottieAnimationView: ViewCodable {
    public func buildViewHierarchy() {
        addSubview(lottieAnimation)
        addSubview(label)
    }

    public func addConstraints() {
        lottieAnimation.layout.applyConstraint { view in
            view.centerXAnchor(equalTo: centerXAnchor)
            view.centerYAnchor(equalTo: centerYAnchor)
            view.widthAnchor(equalTo: widthAnchor, multiplier: 0.8)
            view.aspectRadio(constant: 2)
        }

        label.layout.applyConstraint { view in
            view.topAnchor(equalTo: lottieAnimation.bottomAnchor, priority: .defaultHigh)
            view.leftAnchor(equalTo: leftAnchor)
            view.rightAnchor(equalTo: rightAnchor)
        }
    }
}
