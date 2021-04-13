//
//  GoogleSignInViewController.swift
//  Food
//
//  Created by Phillip OReggio on 4/11/21.
//

import GoogleSignIn
import SwiftUI

/// This View is used by GoogleSignIn to present a view controller for the the user to sign in.
/// This view just has to be alive in the hierarchy in order for it to present (does not even have to be visible)
struct GoogleSignInView: UIViewControllerRepresentable {
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
