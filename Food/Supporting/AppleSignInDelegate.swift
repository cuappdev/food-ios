//
//  AppleSignInDelegate.swift
//  Food
//
//  Created by Hanzheng Li on 5/1/21.
//

import AuthenticationServices

class AppleSignInDelegate: NSObject {
    private let signInSucceeded: ((Bool) -> Void)?
    private weak var window: UIWindow!
    
    init(window: UIWindow?, onSignedIn: ((Bool) -> Void)?) {
        self.window = window
        self.signInSucceeded = onSignedIn
    }
    
    private func registerUser(credential: ASAuthorizationAppleIDCredential) {
        print("Registered \(credential.fullName!)'s account with Apple")
        signInSucceeded?(true)
    }
    
    private func signInUser(credential: ASAuthorizationAppleIDCredential) {
        print("Created new account with Apple")
        signInSucceeded?(true)
    }
    
    private func  signInWithUserAndPassword(credential: ASPasswordCredential) {
        print("Signing in with user and password")
        signInSucceeded?(true)
    }
}

extension AppleSignInDelegate: ASAuthorizationControllerDelegate {
    
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            if appleIDCredential.fullName != nil {
                // Apple authorized w/ Apple ID & password
                registerUser(credential: appleIDCredential)
            } else {
                // User already exists w/ Apple Identity Provider
                signInUser(credential: appleIDCredential)
            }
        case let passwordCredential as ASPasswordCredential:
            // Username & password found in iCloud Keychain
            signInWithUserAndPassword(credential: passwordCredential)
        default: break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}

extension AppleSignInDelegate: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        self.window
    }
}
