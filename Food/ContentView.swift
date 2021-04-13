//
//  ContentView.swift
//  Food
//
//  Created by Phillip OReggio on 3/11/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var signInManager: GoogleSignInManager
    private var googleSignInViewController = UIViewController()

    private func loggedOutViews() -> some View {
        VStack {
            GoogleSignInViewController()
                .frame(width: 0, height: 0)
            Spacer()
            Text("Hello world!")
                .padding()
            GoogleSignInButton()
                .frame(height: 48)
                .padding(90)
            Spacer()
        }
    }

    private func loggedInViews() -> some View {
        let user = signInManager.user

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
                signInManager.signOut()
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
