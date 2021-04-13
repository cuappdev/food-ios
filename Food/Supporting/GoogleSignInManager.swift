//
//  GoogleSignInManager.swift
//  Food
//
//  Created by Phillip OReggio on 4/10/21.
//

import Foundation
import GoogleSignIn

class GoogleSignInManager: ObservableObject {

    private var delegate: GoogleSignInManager.GoogleSignInDelegate

    var isSignedIn: Bool {
        GIDSignIn.sharedInstance()?.hasPreviousSignIn() ?? false
    }

    var user: GIDGoogleUser? {
        GIDSignIn.sharedInstance()?.currentUser
    }

    private init() {
        delegate = GoogleSignInDelegate()
    }

    static func create() -> GoogleSignInManager {
        let signInManager = GoogleSignInManager()
        signInManager.delegate.manager = signInManager
        GIDSignIn.sharedInstance().delegate = signInManager.delegate
        return signInManager
    }

    func signIn() {
        GIDSignIn.sharedInstance().signIn()
        objectWillChange.send()
    }

    func signOut() {
        GIDSignIn.sharedInstance().signOut()
        objectWillChange.send()
    }

    private class GoogleSignInDelegate: NSObject, GIDSignInDelegate {
        weak var manager: GoogleSignInManager?

        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }

            manager?.objectWillChange.send()
        }

        func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
            manager?.objectWillChange.send()
        }
    }
}
