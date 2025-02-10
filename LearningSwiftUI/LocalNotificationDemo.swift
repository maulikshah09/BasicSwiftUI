//
//  LocalNotificationDemo.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/9/25.
//

import SwiftUI
import UserNotifications
import CoreLocation

final class LocationNoticationManager {
    static let instance = LocationNoticationManager()
    
    private init() {}
    
    func requestAuthorization() {
        let options : UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) {success , error in
            if let error = error {
                print("ERROR : \(error.localizedDescription)")
            }else{
                print("Success")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notificaiton"
        content.subtitle = "THis was sooo easy"
        content.sound = .default
        content.badge = 1
        
        // time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
       
        // date
//        var dateComponents = DateComponents()
//        dateComponents.hour = 13
//        dateComponents.minute = 31
//        dateComponents.weekday = 2
//        // every 2 weekday 1: 31 pm shows notification
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//        
        
        //location
//        let coordinates: CLLocationCoordinate2D = .init(latitude: 40.00, longitude: 50.00)
//        
//        let region = CLCircularRegion(
//            center:coordinates ,
//            radius: 100,
//            identifier: UUID().uuidString)
//        
//        region.notifyOnEntry = true // when enter
//        region.notifyOnExit = true // when exist
//        
//        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request  =  UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification () {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotificationDemo: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request permission"){
                LocationNoticationManager.instance.requestAuthorization()
            }
            
            Button("Schedule notification"){
                LocationNoticationManager.instance.scheduleNotification()
            }
            
            Button("Remove notification"){
                LocationNoticationManager.instance.cancelNotification()
            }
        }
        .onAppear{
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

#Preview {
    LocalNotificationDemo()
}
