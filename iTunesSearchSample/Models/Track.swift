//
//  Track.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 21/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: Decodable model used for fetching data from url.

struct Results: Decodable {
    private enum CodingKeys: String, CodingKey {
        case resultCount, results
    }
    let resultCount: Int?
    let results: [Track]?
}

struct Track: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case wrapperType, kind, artistId, collectionId, trackId, artistName, collectionName, trackName, collectionCensoredName, trackCensoredName, artistViewUrl, collectionViewUrl, trackViewUrl, previewUrl, artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate,  collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country,  currency, primaryGenreName, isStreamable

    }
    
    var wrapperType: String?
    var kind: String?
    var artistId: Double?
    var collectionId: Double?
    var trackId: Double?
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var collectionCensoredName: String?
    var trackCensoredName: String?
    var artistViewUrl: String?
    var collectionViewUrl: String?
    var trackViewUrl: String?
    var previewUrl: String?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var collectionPrice: Float?
    var trackPrice: Float?
    var releaseDate: String?
    var collectionExplicitness: String?
    var trackExplicitness: String?
    var discCount: Int?
    var discNumber: Int?
    var trackCount: Int?
    var trackNumber: Int?
    var trackTimeMillis: Double?
    var country: String?
    var currency: String?
    var primaryGenreName: String?
    var isStreamable: Bool?
}
