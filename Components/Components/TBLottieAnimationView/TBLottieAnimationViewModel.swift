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
