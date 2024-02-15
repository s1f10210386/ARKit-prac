//
//  Coordinator.swift
//  ARKit-prac
//
//  Created by 金澤帆高 on 2024/02/12.
//

import Foundation
import RealityKit
import ARKit
import CoreLocation

class Coordinator: NSObject, CLLocationManagerDelegate ,ARCoachingOverlayViewDelegate{
    var arView: ARView?
    let locationManager = CLLocationManager()
    var currentLocaion: CLLocation?
    
    //ここでlocationManagerの諸々初期設定
    override init(){
        super.init()
        //位置情報の更新を受け取れるようにする
        locationManager.delegate = self
        //小さな移動でも位置情報の更新を行うように
        locationManager.distanceFilter = kCLDistanceFilterNone
        //した二つで位置情報の取得を開始！
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
        
    }
    
    //ユーザーのデバイスの位置情報を更新
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocaion = locations.first
    }
    //エラーが出た場合
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        //表示したい場所の緯度と経度を入力(とりあえず赤羽公園)
        let coordinate = CLLocationCoordinate2D(latitude: 35.777672, longitude:139.724575)
        let geoAnchor = ARGeoAnchor(coordinate: coordinate)
        let anchorEntity = AnchorEntity(anchor: geoAnchor)
        let modelEntity = ModelEntity(mesh: MeshResource.generateBox(size: 0.5))
        anchorEntity.addChild(modelEntity)

        arView?.session.add(anchor: geoAnchor) //仮想オブジェクトをどこに固定するか決定
        arView?.scene.addAnchor(anchorEntity) //オブジェクトを実際に配置
        
    }
            
    
    
}
