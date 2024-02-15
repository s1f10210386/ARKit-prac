//
//  ARView+Extension.swift
//  ARKit-prac
//
//  Created by 金澤帆高 on 2024/02/12.
//

import Foundation
import RealityKit
import ARKit

extension ARView {
    
    //ユーザーがAR体験をスムーズに行えるようにチュートリアルみたいな？ものを表示する
    func setupCoachingOverlay(_ delegate: Coordinator) {
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = self.session
        coachingOverlay.goal = .geoTracking
        coachingOverlay.delegate = delegate

        self.addSubview(coachingOverlay)

    }
    
}
