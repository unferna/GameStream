//
//  Game.swift
//  GameStream
//
//  Created by Fernando Florez on 22/08/21.
//

import Foundation

struct Game: Codable, Hashable {
    var title: String
    var studio: String
    var contentRaiting: String
    var publicationYear: String
    var description: String
    var platforms: [String]
    var tags: [String]
    var videosUrls: VideoUrl
    var galleryImages: [String]
}

struct Games: Codable, Hashable {
    var games: [Game]
}
