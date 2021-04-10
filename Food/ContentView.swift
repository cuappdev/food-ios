//
//  ContentView.swift
//  Food
//
//  Created by Phillip OReggio on 3/11/21.
//

import SwiftUI
import GoogleSignIn

private class GoogleSignInManager: UIViewController, GIDSignInDelegate {

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

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("signed out...")
    }

    func setUserInformation(user: GIDGoogleUser) {
        name = user.profile.name
        email = user.profile.email
        userId = user.userID
    }

}

struct GoogleSignInButton: UIViewRepresentable {

    func makeUIView(context: Context) -> GIDSignInButton {
        GIDSignInButton()
    }

    func updateUIView(_ uiView: GIDSignInButton, context: Context) { }

}

struct ContentView: View {

    @State private var signInManager = GoogleSignInManager()

    init() {
        GIDSignIn.sharedInstance().delegate = signInManager
        GIDSignIn.sharedInstance()?.presentingViewController = signInManager
    }

    var body: some View {
        Spacer()
        VStack {
            Text("Hello, world!")
                .padding()

            GoogleSignInButton()
                .frame(height: 80)
                .padding(90)

        }
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
