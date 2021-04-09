//
//  ContentView.swift
//  Food
//
//  Created by Phillip OReggio on 3/11/21.
//

import SwiftUI
import GoogleSignIn

private class GoogleSignInManager: NSObject, GIDSignInDelegate {

    var name: String?
    var email: String?
    var userId: String?

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
            return
        }

        setUserInformation(user: user)
    }

    func setUserInformation(user: GIDGoogleUser) {
        name = user.profile.name
        email = user.profile.email
        userId = user.userID
    }

    // override init() {
    //     GIDSignIn.sharedInstance().delegate = self

    //     let presentingViewController = UIApplication.shared.windows.last?.rootViewController
    //     print("presentingViewController: \(presentingViewController)")
    //     GIDSignIn.sharedInstance()?.presentingViewController = presentingViewController
    // }

}

struct ContentView: View {

    @State private var signInManager = GoogleSignInManager()

    init() {
        GIDSignIn.sharedInstance().delegate = signInManager

        let presentingViewController = UIApplication.shared.windows.last?.rootViewController
        print("presentingViewController: \(presentingViewController)")
        // TODO this is nil; where to present...
        GIDSignIn.sharedInstance()?.presentingViewController = presentingViewController
    }

    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
