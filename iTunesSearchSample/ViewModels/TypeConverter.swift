//
//  TypeConverter.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 22/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import Foundation
import RealmSwift


// MARK: - Doing things the long way because RealmSwift.Results<T> is lazy var.
class TypeConverter {
    
    static let sharedInstance = TypeConverter()
    
    /// Converting [Track] to RealmObject (Results<RealmTrack>)

    func assigningObjectToRealmObject(_ track: Track,_ completion: @escaping (RealmTrack) -> ()){
        
            let rTrack = RealmTrack()
            rTrack.wrapperType = track.wrapperType ?? ""
            rTrack.kind = track.kind ?? ""
            rTrack.artistId.value = track.artistId ?? Double()
            rTrack.collectionId.value = track.collectionId ?? Double()
            rTrack.trackId = String(describing: track.trackId) 
            rTrack.artistName = track.artistName ?? ""
            rTrack.collectionName = track.collectionName ?? ""
            rTrack.trackName = track.trackName ?? ""
            rTrack.collectionCensoredName = track.collectionCensoredName ?? ""
            rTrack.trackCensoredName = track.trackCensoredName ?? ""
            rTrack.artistViewUrl = track.artistViewUrl ?? ""
            rTrack.collectionViewUrl = track.collectionViewUrl ?? ""
            rTrack.trackViewUrl = track.trackViewUrl ?? ""
            rTrack.previewUrl = track.previewUrl ?? ""
            rTrack.artworkUrl30 = track.artworkUrl30 ?? ""
            rTrack.artworkUrl60 = track.artworkUrl60 ?? ""
            rTrack.artworkUrl100 = track.artworkUrl100 ?? ""
            rTrack.collectionPrice.value = track.collectionPrice ?? Float()
            rTrack.trackPrice.value = track.trackPrice ?? Float()
            rTrack.releaseDate = track.releaseDate ?? ""
            rTrack.collectionExplicitness = track.collectionExplicitness ?? ""
            rTrack.trackExplicitness = track.trackExplicitness ?? ""
            rTrack.discCount.value = track.discCount ?? Int()
            rTrack.discNumber.value = track.discNumber ?? Int()
            rTrack.trackCount.value = track.trackCount ?? Int()
            rTrack.trackNumber.value = track.trackNumber ?? Int()
            rTrack.trackTimeMillis.value = track.trackTimeMillis ?? Double()
            rTrack.country = track.country ?? ""
            rTrack.currency = track.currency ?? ""
            rTrack.primaryGenreName = track.primaryGenreName ?? ""
            rTrack.isStreamable.value = track.isStreamable ?? false
        
            completion(rTrack)
        
    }
}
