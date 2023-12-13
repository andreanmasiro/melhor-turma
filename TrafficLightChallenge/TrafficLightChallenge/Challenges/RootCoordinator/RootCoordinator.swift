//
//  RootCoordinator.swift
//  TrafficLightChallenge
//
//  Created by André Rodrigues on 13/12/23.
//

import UIKit

class RootCoordinator {
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        window.rootViewController = ChallengeOneViewController()
    }
}
