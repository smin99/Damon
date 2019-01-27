//
//  AppDelegate.swift
//  Damon
//
//  Created by HwangSeungmin on 1/26/19.
//  Copyright © 2019 Min. All rights reserved.
//

import UIKit
import Firebase

protocol ReceivedAlarmDelegate {
    func receivedAlarm()
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate {

    static var timeDelta: Double = 0.0              // 서버 시간과 로컬 시간 보정값
    
    var window: UIWindow?
    var alarmDelegate: ReceivedAlarmDelegate?
    
    static func sharedInstance() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()                                             // Firebase Library 초기화
        Messaging.messaging().delegate = self
        // FCM messaging delegate 설정
        //Database.database().isPersistenceEnabled = true                   // Database off-line mode on
        
        application.registerForRemoteNotifications()
        
        // 서버 시간을 읽어서 시간 동기화  1516104054.9973, 1516370098.814
        let url = URL(string: ConstCommon.getTimeDataUrl)     // 리턴값 : 1518790170732
        let task = URLSession.shared.dataTask(with: url! as URL) { data, response, error in
            guard let data = data, error == nil else { return }
            if let strTime = String(data: data, encoding: .utf8) {
                if let intTime = Int(strTime) {
                    let doubleServerTime: Double = Double(intTime) / 1000.0
                    let doubleLocalTime: Double = Double(Date().timeIntervalSince1970)
                    
                    if abs(doubleLocalTime - doubleServerTime) > 5.0 {     // 5초 이상의 시간차이가 나면 델타 값을 보정한다.
                        AppDelegate.timeDelta = doubleLocalTime - doubleServerTime
                        print("server time delta: \(AppDelegate.timeDelta)")
                    } else {
                        AppDelegate.timeDelta = 0.0
                    }
                }
            }
        }
        task.resume()
        
        ControlUtil.setThemeColor(tintColor: ThemeColor.tintColor, barTintColor: ThemeColor.barTintColor)
        return true
    }
}
