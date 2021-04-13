//
//  Keys.swift
//  Food
//
//  Created by Phillip OReggio on 4/11/21.
//

import Foundation

struct Keys {
    static let googleClientID = Keys.googleServiceDict["CLIENT_ID"] as? String ?? ""

    private static let googleServiceDict: NSDictionary = {
        guard let path = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path)
        else { return [:] }
        return dict
    }()
}
