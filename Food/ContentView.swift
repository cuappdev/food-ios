//
//  ContentView.swift
//  Food
//
//  Created by Phillip OReggio on 3/11/21.
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {

    @EnvironmentObject var signInManager: GoogleSignInManager
    private var googleSignInViewController = UIViewController()

    private func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().delegate = signInManager
    }

    private func loggedOutViews() -> some View {
        VStack {
            Spacer()

            Text("Hello world!")
              .padding()

            GoogleSignInViewController()
              .frame(width: 0, height: 0)

            GoogleSignInButton()
                .frame(height: 48)
                .padding(90)

            Spacer()
        }
          .onAppear(perform: setupGoogleSignIn)
    }

    private func loggedInViews() -> some View {
        let user = GIDSignIn.sharedInstance()?.currentUser

        let name: String
        if let user = user {
            name = user.profile.name
        } else {
            name = "Anonymous"
        }

        return VStack {
            Spacer()

            Text("Hello \(name)")

            Spacer()

            Button("Sign Out") {
                GIDSignIn.sharedInstance().signOut()
                signInManager.objectWillChange.send()
            }

            Spacer()
        }
          .padding()
    }

    var body: some View {
        if signInManager.isSignedIn {
            loggedInViews()
        } else {
            loggedOutViews()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
