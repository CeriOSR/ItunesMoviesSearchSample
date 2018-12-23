//
//  TracksViewModel.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 22/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import Foundation
import RealmSwift


class TracksViewModel {
    
    static let sharedInstance = TracksViewModel()
    let tracks = CacheManager.sharedInstance.getDataFromDB()
    
    /// assigning track object into a Realm Object for saving
    func assigningObjectToRealmObject(_ tracks: [Track],_ completion: @escaping (List<RealmTrack>) -> ()){
        let trackLists = List<RealmTrack>()
        
            for i in tracks {
                let track = RealmTrack()
                track.wrapperType = i.wrapperType
                track.kind = i.kind
                track.artistId.value = i.artistId
                track.collectionId.value = i.collectionId
                track.trackId.value = i.trackId
                track.artistName = i.artistName
                track.collectionName = i.collectionName
                track.trackName = i.trackName
                track.collectionCensoredName = i.collectionCensoredName
                track.trackCensoredName = i.trackCensoredName
                track.artistViewUrl = i.artistViewUrl
                track.collectionViewUrl = i.collectionViewUrl
                track.trackViewUrl = i.trackViewUrl
                track.previewUrl = i.previewUrl
                track.artworkUrl30 = i.artworkUrl30
                track.artworkUrl60 = i.artworkUrl60
                track.artworkUrl100 = i.artworkUrl100
                track.collectionPrice.value = i.collectionPrice
                track.trackPrice.value = i.trackPrice
                track.releaseDate = i.releaseDate
                track.collectionExplicitness = i.collectionExplicitness
                track.trackExplicitness = i.trackExplicitness
                track.discCount.value = i.discCount
                track.discNumber.value = i.discNumber
                track.trackCount.value = i.trackCount
                track.trackNumber.value = i.trackNumber
                track.trackTimeMillis.value = i.trackTimeMillis
                track.country = i.country
                track.currency = i.currency
                track.primaryGenreName = i.primaryGenreName
                track.isStreamable.value = i.isStreamable
                
                trackLists.append(track)
                completion(trackLists)
            }
    }
}
