//
//  GoogleSignInManager.swift
//  Food
//
//  Created by Phillip OReggio on 4/10/21.
//

import Foundation
import GoogleSignIn

class GoogleSignInManager: NSObject, GIDSignInDelegate, ObservableObject {

    @Published var name: String?
    @Published var email: String?
    @Published var userId: String?

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
            return
        }

        setUserInformation(user: user)
        print("signed in (:")
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("signed out...")
    }

    func setUserInformation(user: GIDGoogleUser) {
        name = user.profile.name
        email = user.profile.email
        userId = user.userID
    }

}
