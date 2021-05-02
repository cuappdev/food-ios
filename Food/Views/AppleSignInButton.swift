//
//  AppleSignInButton.swift
//  Food
//
//  Created by Hanzheng Li on 5/1/21.
//

import AuthenticationServices
import SwiftUI

struct AppleSignInButton: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: colorScheme == .dark ? .white : .black)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
