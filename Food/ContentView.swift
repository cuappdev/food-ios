//
//  ContentView.swift
//  Food
//
//  Created by Phillip OReggio on 3/11/21.
//

import AuthenticationServices
import SwiftUI

struct ContentView: View {
    @Environment(\.window) var window: UIWindow?
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
            AppleSignInButton()
                .frame(width: 280, height: 60)
                .onTapGesture(perform: showAppleLogin)
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
    
    private func showAppleLogin() {
        let appleIDRequest = ASAuthorizationAppleIDProvider().createRequest()
        appleIDRequest.requestedScopes = [.fullName]
        let passwordRequest = ASAuthorizationPasswordProvider().createRequest()
        let controller = ASAuthorizationController(authorizationRequests: [appleIDRequest, passwordRequest])
        let delegate = AppleSignInDelegate(window: window) { didSucceed in
            if didSucceed {
                print("yay i succeeded")
            } else {
                print("oh no i failed")
            }
        }
        controller.delegate = delegate
        controller.presentationContextProvider = delegate
        controller.performRequests()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
