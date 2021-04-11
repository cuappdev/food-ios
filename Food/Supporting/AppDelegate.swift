//
//  AppDelegate.swift
//  Food
//
//  Created by Phillip OReggio on 4/10/21.
//

import GoogleSignIn
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {

        GIDSignIn.sharedInstance().clientID = Keys.googleClientID
        FirebaseApp.configure()

        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any]
    ) -> Bool {
        GIDSignIn.sharedInstance().handle(url)
    }

}
