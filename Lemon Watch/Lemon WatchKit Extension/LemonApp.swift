//
//  LemonApp.swift
//  Lemon WatchKit Extension
//
//  Created by Antonio García Aprea on 26/06/2022.
//

import SwiftUI

@main
struct LemonApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView(myCard: Card(isPaused: false, isFlagged: false, number: ""))
            }
        }
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
