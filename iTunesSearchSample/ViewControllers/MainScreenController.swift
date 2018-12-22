//
//  MainScreenController.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 21/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import UIKit
import RealmSwift

class MainScreenController: UIViewController {

    let cellId = "cellId"
    let fetchObjects = FetchObjectsFromUrl()
    let backgroundView = MainScreenBackgroundView()
    let searchView = MainScreenSearchView()
    let collectionVContainer = UIView()
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: self.collectionVContainer.frame, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        
        return cv
    }()
    
    var trackList : RealmSwift.Results<RealmTrack>?
    var tracks = [Track]()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MainScreenCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        setupViews()
        self.tracks = self.fetchObjects.fetchObject()
        print(tracks.count)
        let realmTracks = TracksViewModel.sharedInstance.assiningObjectToRealmObject(tracks)
        for track in realmTracks {
            CacheManager.sharedInstance.addData(object: track)
        }
        self.trackList = CacheManager.sharedInstance.getDataFromDB()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    private func setupViews() {
        view.addSubview(backgroundView)
        view.addSubview(searchView)
        view.addSubview(collectionVContainer)
        
        backgroundView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        searchView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 30, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 50)
        collectionVContainer.anchor(searchView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        collectionVContainer.addSubview(collectionView)
        collectionView.anchor(collectionVContainer.topAnchor, left: collectionVContainer.leftAnchor, bottom: collectionVContainer.bottomAnchor, right: collectionVContainer.rightAnchor, topConstant: 0, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 0)
    }

}

// Mark: Using a collectionView for a carousel effect.
extension MainScreenController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trackList?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MainScreenCollectionViewCell
        cell.titleLbl.text = trackList?[indexPath.item].artistName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionVContainer.frame.width * 0.75, height: collectionVContainer.frame.height * 0.6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 75.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 150.0
    }

}



