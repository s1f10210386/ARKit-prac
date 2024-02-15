//import SwiftUI
//import ARKit
//import Combine
//
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
import ARKit
import Combine
import RealityKit

class ARViewModel: ObservableObject {
    var arView: ARView = ARView() // RealityKitのARView

    @Published var referenceObjects: Set<ARReferenceObject> = []

    init() {
        loadReferenceObjects()
    }

    private func loadReferenceObjects() {
        // `.arobject`ファイルからARReferenceObjectを読み込む処理
        guard let referenceObjects = ARReferenceObject.referenceObjects(inGroupNamed: "Biore", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        self.referenceObjects = referenceObjects
    }

    func startARSession() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionObjects = referenceObjects
        arView.session.run(configuration)
    }
}
