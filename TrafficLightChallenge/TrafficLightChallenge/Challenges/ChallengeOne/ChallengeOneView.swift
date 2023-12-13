//
//  ChallengeOneView.swift
//  TrafficLightChallenge
//
//  Created by André Rodrigues on 13/12/23.
//

import UIKit

class ChallengeOneView: UIView {
    let trafficLightView = TrafficLightView()
    let segmentedControl = UISegmentedControl()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .white

        self.addSubview(self.trafficLightView)
        self.addSubview(self.segmentedControl)

        self.setUpLayout()
    }

    func setUpLayout() {
        self.trafficLightView.translatesAutoresizingMaskIntoConstraints = false
        self.segmentedControl.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.trafficLightView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
            self.trafficLightView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            self.trafficLightView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.trafficLightView.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            self.segmentedControl.topAnchor.constraint(equalTo: self.trafficLightView.bottomAnchor, constant: 32),
            self.segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
