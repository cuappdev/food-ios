//
//  GoogleSignInManager.swift
//  Food
//
//  Created by Phillip OReggio on 4/10/21.
//

import Foundation
import GoogleSignIn

class GoogleSignInManager: NSObject, GIDSignInDelegate, ObservableObject {
    var isSignedIn: Bool {
        GIDSignIn.sharedInstance()?.hasPreviousSignIn() ?? false
    }

    var user: GIDGoogleUser? {
        GIDSignIn.sharedInstance()?.currentUser
    }

    override init() {
        super.init()
        GIDSignIn.sharedInstance()?.delegate = self
    }

    func signIn() {
        GIDSignIn.sharedInstance().signIn()
    }

    func signOut() {
        GIDSignIn.sharedInstance().signOut()
        objectWillChange.send()
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
            return
        }

        objectWillChange.send()
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        objectWillChange.send()
    }
}
