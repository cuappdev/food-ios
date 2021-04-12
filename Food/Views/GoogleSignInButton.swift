//
//  GoogleSignInButton.swift
//  Food
//
//  Created by Phillip OReggio on 4/10/21.
//

import GoogleSignIn
import SwiftUI

struct GoogleSignInButton: UIViewRepresentable {
    func makeUIView(context: Context) -> GIDSignInButton {
        GIDSignInButton()
    }

    func updateUIView(_ uiView: GIDSignInButton, context: Context) { }
}

struct GoogleSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSignInButton()
    }
}
