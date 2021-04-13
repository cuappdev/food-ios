//
//  FoodApp.swift
//  Food
//
//  Created by Phillip OReggio on 3/11/21.
//

import SwiftUI

@main
struct FoodApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(GoogleSignInManager())
        }
    }
}
