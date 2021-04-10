//
//  AppDelegate.swift
//  Food
//
//  Created by Phillip OReggio on 4/10/21.
//

import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {

        GIDSignIn.sharedInstance().clientID = "TODO"

        return true
    }

}
