//
//  Network.swift
//  Food
//
//  Created by Hanzheng Li on 4/22/21.
//

import Apollo
import Combine
import Foundation

class Network {
    static let shared = ApolloClient(url: URL(string: "https://graphql.anilist.co/")!)
    
    static func getMedia(for id: Int, _ completion: @escaping (Media) -> Void) {
        Network.shared.fetch(query: DetailQuery(id: id)) { result in
            switch result {
            case .success(let result):
                guard let media = result.data?.media else { return }
                completion(Media(from: media))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
