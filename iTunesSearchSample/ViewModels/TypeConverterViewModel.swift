//
//  TracksViewModel.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 22/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import Foundation
import RealmSwift


// MARK: - Doing things the long way because RealmSwift.Results<T> is lazy var.
class TypeConverterViewModel {
    
    static let sharedInstance = TypeConverterViewModel()
    
    /// Converting [Track] to RealmObject (Results<RealmTrack>)

    func assigningObjectToRealmObject(_ track: Track,_ completion: @escaping (RealmTrack) -> ()){
//        let trackLists = List<RealmTrack>()
        
            let rTrack = RealmTrack()
            rTrack.wrapperType = track.wrapperType
            rTrack.kind = track.kind
            rTrack.artistId.value = track.artistId
            rTrack.collectionId.value = track.collectionId
            rTrack.trackId.value = track.trackId
            rTrack.artistName = track.artistName
            rTrack.collectionName = track.collectionName
            rTrack.trackName = track.trackName
            rTrack.collectionCensoredName = track.collectionCensoredName
            rTrack.trackCensoredName = track.trackCensoredName
            rTrack.artistViewUrl = track.artistViewUrl
            rTrack.collectionViewUrl = track.collectionViewUrl
            rTrack.trackViewUrl = track.trackViewUrl
            rTrack.previewUrl = track.previewUrl
            rTrack.artworkUrl30 = track.artworkUrl30
            rTrack.artworkUrl60 = track.artworkUrl60
            rTrack.artworkUrl100 = track.artworkUrl100
            rTrack.collectionPrice.value = track.collectionPrice
            rTrack.trackPrice.value = track.trackPrice
            rTrack.releaseDate = track.releaseDate
            rTrack.collectionExplicitness = track.collectionExplicitness
            rTrack.trackExplicitness = track.trackExplicitness
            rTrack.discCount.value = track.discCount
            rTrack.discNumber.value = track.discNumber
            rTrack.trackCount.value = track.trackCount
            rTrack.trackNumber.value = track.trackNumber
            rTrack.trackTimeMillis.value = track.trackTimeMillis
            rTrack.country = track.country
            rTrack.currency = track.currency
            rTrack.primaryGenreName = track.primaryGenreName
            rTrack.isStreamable.value = track.isStreamable
        
//                trackLists.append(track)
            completion(rTrack)
        
    }
    
    /// Converting RealmObject (Results<RealmTrack>) to [Track]
    func assigningResultsToTracks(_ results: RealmTrack,_ completion: @escaping (Track) -> ()) {
        
        var track = Track()
        track.wrapperType = results.wrapperType
        track.kind = results.kind
        track.artistId = results.artistId.value
        track.collectionId = results.collectionId.value
        track.trackId = results.trackId.value
        track.artistName = results.artistName
        track.collectionName = results.collectionName
        track.trackName = results.trackName
        track.collectionCensoredName = results.collectionCensoredName
        track.trackCensoredName = results.trackCensoredName
        track.artistViewUrl = results.artistViewUrl
        track.collectionViewUrl = results.collectionViewUrl
        track.trackViewUrl = results.trackViewUrl
        track.previewUrl = results.previewUrl
        track.artworkUrl30 = results.artworkUrl30
        track.artworkUrl60 = results.artworkUrl60
        track.artworkUrl100 = results.artworkUrl100
        track.collectionPrice = results.collectionPrice.value
        track.trackPrice = results.trackPrice.value
        track.releaseDate = results.releaseDate
        track.collectionExplicitness = results.collectionExplicitness
        track.trackExplicitness = results.trackExplicitness
        track.discCount = results.discCount.value
        track.discNumber = results.discNumber.value
        track.trackCount = results.trackCount.value
        track.trackNumber = results.trackNumber.value
        track.trackTimeMillis = results.trackTimeMillis.value
        track.country = results.country
        track.currency = results.currency
        track.primaryGenreName = results.primaryGenreName
        track.isStreamable = results.isStreamable.value
        
            completion(track)
        
    }
}
