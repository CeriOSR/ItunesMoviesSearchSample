//
//  RealmTrack.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 22/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import Foundation
import RealmSwift

class RealmTrack: Object {
    @objc dynamic var wrapperType: String? = nil
    @objc dynamic var kind: String? = nil
    let artistId = RealmOptional<Double>()
    let collectionId = RealmOptional<Double>()
//    convert trackId to string
    @objc dynamic var trackId: String? = nil
    @objc dynamic var artistName: String? = nil
    @objc dynamic var collectionName: String? = nil
    @objc dynamic var trackName: String? = nil
    @objc dynamic var collectionCensoredName: String? = nil
    @objc dynamic var trackCensoredName: String? = nil
    @objc dynamic var artistViewUrl: String? = nil
    @objc dynamic var collectionViewUrl: String? = nil
    @objc dynamic var trackViewUrl: String? = nil
    @objc dynamic var previewUrl: String? = nil
    @objc dynamic var artworkUrl30: String? = nil
    @objc dynamic var artworkUrl60: String? = nil
    @objc dynamic var artworkUrl100: String? = nil
    let collectionPrice = RealmOptional<Float>()
    let trackPrice = RealmOptional<Float>()
    @objc dynamic var releaseDate: String? = nil
    @objc dynamic var collectionExplicitness: String? = nil
    @objc dynamic var trackExplicitness: String? = nil
    let discCount = RealmOptional<Int>()
    let discNumber = RealmOptional<Int>()
    let trackCount = RealmOptional<Int>()
    let trackNumber = RealmOptional<Int>()
    let trackTimeMillis = RealmOptional<Double>()
    @objc dynamic var country: String? = nil
    @objc dynamic var currency: String? = nil
    @objc dynamic var primaryGenreName: String? = nil
    let isStreamable = RealmOptional<Bool>()
    
    override static func primaryKey() -> String? {
        return "trackId"
    }
}

