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
    
    let wrapperType: String?
    let kind: String?
    let artistId: Double?
    let collectionId: Double?
    let trackId: Double?
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewUrl: String?
    let collectionViewUrl: String?
    let trackViewUrl: String?
    let previewUrl: String?
    let artworkUrl30: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let collectionPrice: Float?
    let trackPrice: Float?
    let releaseDate: String?
    let collectionExplicitness: String?
    let trackExplicitness: String?
    let discCount: Int?
    let discNumber: Int?
    let trackCount: Int?
    let trackNumber: Int?
    let trackTimeMillis: Double?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let isStreamable: Bool?
}
