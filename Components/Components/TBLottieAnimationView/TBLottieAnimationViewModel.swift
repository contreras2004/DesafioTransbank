//
//  TBLottieAnimationViewModel.swift
//  Components
//
//  Created by Matías Contreras on 31-08-20.
//  Copyright © 2020 matias. All rights reserved.
//

import Foundation

public enum TBLottieAnimation: String {
    case loading
    case noConnection
    case genericError
    case emptyResults
    case searchTerm
}

public struct TBLottieAnimationViewModel: Equatable{
    let message: String
    let animation: TBLottieAnimation
    let loopAnimation: Bool

    public init(message: String, animation: TBLottieAnimation, loopAnimation: Bool = true) {
        self.message = message
        self.animation = animation
        self.loopAnimation = loopAnimation
    }
}
