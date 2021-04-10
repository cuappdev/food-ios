//
//  GoogleSignInManager.swift
//  Food
//
//  Created by Phillip OReggio on 4/10/21.
//

import Foundation
import GoogleSignIn

class GoogleSignInManager: NSObject, GIDSignInDelegate, ObservableObject {

    var silly: Bool = true
    var isSignedIn: Bool {
        GIDSignIn.sharedInstance()?.hasPreviousSignIn() ?? false
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
            return
        }

        print("signed in (:")
        objectWillChange.send()
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("signed out...")
        objectWillChange.send()
    }

}
