//
//  SceneDelegate.swift
//  TrafficLightChallenge
//
//  Created by André Rodrigues on 11/12/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        self.window = window

        let rootCoordinator = RootCoordinator(window: window)
        rootCoordinator.start()
        window.makeKeyAndVisible()
    }
}

