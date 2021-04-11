//
//  ContentView.swift
//  Food
//
//  Created by Phillip OReggio on 3/11/21.
//

import SwiftUI
import GoogleSignIn

struct WrapperViewController: UIViewControllerRepresentable {

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        GIDSignIn.sharedInstance()?.presentingViewController = viewController
        return viewController
    }

    func updateUIViewController(_ viewController: UIViewController, context: Context) {
        print("updating view controller")
    }

    class Coordinator: NSObject {
        var parent: WrapperViewController

        init(_ wrapper: WrapperViewController) {
            parent = wrapper
        }

    }
}

struct ContentView: View {

    @EnvironmentObject var signInManager: GoogleSignInManager
    private var googleSignInViewController = UIViewController()
    @State private var showingSheet = false

    private func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().delegate = signInManager
    }

    private func loggedOutViews() -> some View {
        VStack {
            Spacer()

            Text("Hello world!")
              .padding()

            WrapperViewController()
              .frame(width: 0, height: 0)

            Button("---") {
                showingSheet.toggle()
            }

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
                if let instance = GIDSignIn.sharedInstance() {
                    instance.signOut()
                }
                //GIDSignIn.sharedInstance()?.signOut()
                print("sign out")

                signInManager.objectWillChange.send()
            }.padding()
        }
    }

    var body: some View {
        if signInManager.isSignedIn {
            loggedInViews()
        } else {
            loggedOutViews()
              .sheet(isPresented: $showingSheet) {
                  Text("Hi")
              }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
