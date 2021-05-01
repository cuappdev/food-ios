//
//  Models.swift
//  Food
//
//  Created by Hanzheng Li on 4/22/21.
//

import Foundation

struct Media: Hashable {
    let id: Int
    let title: Title?
    let coverImage: CoverImage?
    let status: MediaStatus?
    let description: String?
    let seasonYear: Int?
    let episodes: Int?
    
    init() {
        self.id = 0
        self.title = nil
        self.coverImage = nil
        self.status = nil
        self.description = nil
        self.seasonYear = nil
        self.episodes = nil
    }
    
    init(from media: DetailQuery.Data.Medium) {
        self.id = media.id
        if let title = media.title {
            self.title = Title(from: title)
        } else {
            self.title = nil
        }
        if let image = media.coverImage {
            self.coverImage = CoverImage(from: image)
        } else {
            self.coverImage = nil
        }
        self.status = media.status
        self.description = media.description
        self.seasonYear = media.seasonYear
        self.episodes = media.episodes
    }
}

struct Title: Hashable {
    let romaji: String?
    let english: String?
    let native: String?
    let userPreferred: String?
    
    var title: String {
        romaji ?? english ?? native ?? userPreferred ?? "?"
    }
    
    init(from title: DetailQuery.Data.Medium.Title) {
        self.romaji = title.romaji
        self.english = title.english
        self.native = title.native
        self.userPreferred = title.userPreferred
    }
}

struct CoverImage: Hashable {
    let medium: URL?
    let large: URL?
    let extraLarge: URL?
    
    var url: URL? {
        medium ?? large ?? extraLarge ?? nil
    }
    
    var urlLargest: URL? {
        extraLarge ?? large ?? medium ?? nil 
    }
    
    init(from image: DetailQuery.Data.Medium.CoverImage) {
        if let medium = image.medium {
            self.medium = URL(string: medium)
        } else {
            self.medium = nil
        }
        if let large = image.large {
            self.large = URL(string: large)
        } else {
            self.large = nil
        }
        if let extraLarge = image.extraLarge {
            self.extraLarge = URL(string: extraLarge)
        } else {
            self.extraLarge = nil
        }
    }
}
