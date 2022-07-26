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
                ContentView(myCard: Card(number: "", status: .active))
            }
        }
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
