//
//  LightView.swift
//  TrafficLightChallenge
//
//  Created by André Rodrigues on 13/12/23.
//

import UIKit

struct LightState {
    var isOn: Bool

    static let on = LightState(isOn: true)
    static let off = LightState(isOn: false)
}

class LightView: UIView {
    let lightColor: UIColor
    var state: LightState = .off {
        didSet {
            self.updateState()
        }
    }

    init(lightColor: UIColor) {
        self.lightColor = lightColor
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateState() {
        self.backgroundColor = if state.isOn {
            self.lightColor
        } else {
            .darkGray
        }
    }
}
