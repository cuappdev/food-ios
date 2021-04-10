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
        GIDSignIn.sharedInstance()?.presentingViewController = googleSignInViewController
    }

    private func loggedOutViews() -> some View {
        VStack {
            Spacer()

            Text("Hello world!")
              .padding()

            GoogleSignInButton()
                .frame(height: 48)
                .padding(90)

            Spacer()
        }.onAppear(perform: setupGoogleSignIn)
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
            Text("Hello \(name)")
              .padding()

            Button("Sign Out") {
                GIDSignIn.sharedInstance()?.signOut()
            }.padding()
        }
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
