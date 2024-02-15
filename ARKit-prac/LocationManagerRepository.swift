//
//  LocationManagerRepository.swift
//  ARKit-prac
//
//  Created by 金澤帆高 on 2024/02/07.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var location: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 高精度の位置情報を要求
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization() // アプリ使用中の位置情報取得の許可を求める
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation() // 位置情報の更新を開始
    }
    
    // CLLocationManagerDelegateメソッド
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last // 最新の位置情報を取得
    }
    
}


