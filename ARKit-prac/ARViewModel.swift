//
//  ARViewModel.swift
//  ARKit-prac
//
//  Created by 金澤帆高 on 2024/02/15.
//

import Foundation
import RealityKit
import ARKit
import Combine

class ARViewModel: ObservableObject {
    var session = ARSession()
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupARSession()
    }
    
    private func setupARSession() {
        let configuration = ARWorldTrackingConfiguration()
        guard let referenceObjects = ARReferenceObject.referenceObjects(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        configuration.detectionObjects = referenceObjects
        session.run(configuration)
    }
    
}


//class ARViewModel: ObservableObject {
//    var session: ARSession
//    var referenceObjects: Set<ARReferenceObject> = []
//    
//    init(session: ARSession = ARSession()) {
//        self.session = session
//        loadReferenceObjects()
//    }
//    
//    private func loadReferenceObjects() {
//        // `.arobject`ファイルからARReferenceObjectを読み込む処理
//        guard let referenceObjects = ARReferenceObject.referenceObjects(inGroupNamed: "Biore", bundle: nil) else {
//            fatalError("Missing expected asset catalog resources.")
//        }
//        self.referenceObjects = referenceObjects
//    }
//    
//    func startARSession() {
//        let configuration = ARWorldTrackingConfiguration()
//        configuration.detectionObjects = referenceObjects
//        session.run(configuration)
//    }
//}
