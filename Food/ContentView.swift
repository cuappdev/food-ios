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

    var body: some View {
        VStack {
            Spacer()

            Text("Hello, world!")
              .padding()

            GoogleSignInButton()
                .frame(height: 48)
                .padding(90)

            Spacer()
        }
        .onAppear(perform: setupGoogleSignIn)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
