//
//  GoogleSignInViewController.swift
//  Food
//
//  Created by Phillip OReggio on 4/11/21.
//

import SwiftUI
import GoogleSignIn

/// This View Controller is used by GoogleSignIn present a view controller that allows the User to sign in
/// This just has to be alive in the heirarchy in order for it to present (does not even have to be visible)
struct GoogleSignInViewController: UIViewControllerRepresentable {

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
        var parent: GoogleSignInViewController

        init(_ viewController: GoogleSignInViewController) {
            parent = viewController
        }

    }

}
