//
//  TrafficLightView.swift
//  TrafficLightChallenge
//
//  Created by André Rodrigues on 11/12/23.
//

import UIKit

enum TrafficLightState: String, CaseIterable {
    case red
    case yellow
    case green
    case intermittent

    var redLightIsOn: Bool {
        self == .red
    }

    var yellowLightIsOn: Bool {
        self == .yellow || self == .intermittent
    }

    var greenLightIsOn: Bool {
        self == .green
    }
}

class TrafficLightView: UIView {
    var lightViewRadius: CGFloat {
        50
    }

    var lightsPadding: CGFloat {
        16
    }

    var state: TrafficLightState = .green {
        didSet {
            updateState()
        }
    }

    let redLightView = LightView(lightColor: .red)
    let yellowLightView = LightView(lightColor: .yellow)
    let greenLightView = LightView(lightColor: .green)

    private var intermittentTimer: Timer?

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .gray
        self.redLightView.backgroundColor = .red
        self.yellowLightView.backgroundColor = .yellow
        self.greenLightView.backgroundColor = .green

        self.addSubview(self.redLightView)
        self.addSubview(self.yellowLightView)
        self.addSubview(self.greenLightView)

        self.setUpLayout()
        self.updateState()
    }

    private func setUpLayout() {
        self.redLightView.layer.cornerRadius = self.lightViewRadius / 2
        self.yellowLightView.layer.cornerRadius = self.lightViewRadius / 2
        self.greenLightView.layer.cornerRadius = self.lightViewRadius / 2

        self.redLightView.translatesAutoresizingMaskIntoConstraints = false
        self.yellowLightView.translatesAutoresizingMaskIntoConstraints = false
        self.greenLightView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.redLightView.bottomAnchor.constraint(equalTo: self.yellowLightView.topAnchor, constant: -self.lightsPadding),
            self.redLightView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.redLightView.widthAnchor.constraint(equalToConstant: self.lightViewRadius),
            self.redLightView.heightAnchor.constraint(equalTo: self.redLightView.widthAnchor),

            self.yellowLightView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.yellowLightView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.yellowLightView.widthAnchor.constraint(equalToConstant: self.lightViewRadius),
            self.yellowLightView.heightAnchor.constraint(equalTo: self.yellowLightView.widthAnchor),

            self.greenLightView.topAnchor.constraint(equalTo: self.yellowLightView.bottomAnchor, constant: self.lightsPadding),
            self.greenLightView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.greenLightView.widthAnchor.constraint(equalToConstant: self.lightViewRadius),
            self.greenLightView.heightAnchor.constraint(equalTo: self.greenLightView.widthAnchor),
        ])
    }

    private func updateState() {
        if self.state == .intermittent {
            self.startIntermittentTimer()
        } else {
            self.invalidateIntermittentTimer()
        }

        self.redLightView.state.isOn = self.state == .red
        self.yellowLightView.state.isOn = self.state == .yellow || self.state == .intermittent
        self.greenLightView.state.isOn = self.state == .green
    }

    private func startIntermittentTimer() {
        let yellowLightView = self.yellowLightView
        self.intermittentTimer = Timer.scheduledTimer(withTimeInterval: 0.66, repeats: true) { _ in
            yellowLightView.state.isOn.toggle()
        }
    }

    private func invalidateIntermittentTimer() {
        self.intermittentTimer?.invalidate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
