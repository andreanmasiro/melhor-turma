//
//  ViewController.swift
//  TrafficLightChallenge
//
//  Created by André Rodrigues on 11/12/23.
//

import UIKit

class ChallengeOneViewController: UIViewController {
    private let trafficLightStates = TrafficLightState.allCases
    let challengeOneView = ChallengeOneView()
    
    override func loadView() {
        self.view = self.challengeOneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let segmentedControl = self.challengeOneView.segmentedControl
        let trafficLightView = self.challengeOneView.trafficLightView
        
        self.trafficLightStates.enumerated().forEach { index, state in
            let action = UIAction(title: state.rawValue.capitalized) { _ in
                trafficLightView.state = state
            }
            segmentedControl.insertSegment(action: action, at: index, animated: false)
        }
        
        let initialIndex = 0
        segmentedControl.selectedSegmentIndex = initialIndex
        if let action = segmentedControl.actionForSegment(at: initialIndex) {
            segmentedControl.sendAction(action)
        }
    }
}
