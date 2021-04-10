//
//  FoodApp.swift
//  Food
//
//  Created by Phillip OReggio on 3/11/21.
//

import SwiftUI
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        // Initialization sign-in
        GIDSignIn.sharedInstance().clientID = "TODO"
        return true
    }

}

@main
struct FoodApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

}
