//
//  ContentView.swift
//  Food
//
//  Created by Phillip OReggio on 3/11/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var signInManager: GoogleSignInManager

    var loggedOutViews: some View {
        VStack {
            GoogleSignInView()
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

    var loggedInViews: some View {
        VStack {
            Spacer()
            if let name = signInManager.user?.profile.name {
                Text("Hello \(name)")
            } else {
                Text("Hello Anonymous")
            }
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
            loggedInViews
        } else {
            loggedOutViews
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
