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
    let headerView = MainScreenHeaderView()
    let collectionVContainer = UIView()
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: self.collectionVContainer.frame, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        cv.isUserInteractionEnabled = true
        return cv
    }()
    
    var arrayOfTracksIndex = 0
    var arrayOfTracksMaxCount = 0
    var arrayOfTracks = [[Track]]()
    var convertedTracks = [Track]()
    var trackList : RealmSwift.Results<RealmTrack>? {
        didSet{
                print(self.trackList?.count ?? 0)
            for i in self.trackList! {
                    TypeConverterViewModel.sharedInstance.assigningResultsToTracks(i, { (track) in
                        self.convertedTracks.append(track)
                        print(self.convertedTracks.count)
                    })
                }
            self.arrayOfTracks = convertedTracks.chunked(into: 10)
            arrayOfTracksMaxCount = arrayOfTracks.count
            print(self.arrayOfTracks.count)
                self.tracks.append(contentsOf: arrayOfTracks[0])
                self.arrayOfTracksIndex += 1
                print(tracks.count)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    var tracks = [Track](){
        didSet {
            DispatchQueue.main.async {
                //change this to reload [index] later
                print(self.tracks.count)
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView.register(MainScreenCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        setupViews()
    }
    
    /// Setting up the views in MainScreenController
    private func setupViews() {
        view.addSubview(backgroundView)
        view.addSubview(headerView)
        view.addSubview(collectionVContainer)
        
        backgroundView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        headerView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 30, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 50)
        collectionVContainer.anchor(headerView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        collectionVContainer.addSubview(collectionView)
        collectionView.anchor(collectionVContainer.topAnchor, left: collectionVContainer.leftAnchor, bottom: collectionVContainer.bottomAnchor, right: collectionVContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    /// Show the Navigation Bar when we push the details view modally.
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}

// Mark:- CollectionView Methods
extension MainScreenController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tracks.count
    }
    
    /// Input data into UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MainScreenCollectionViewCell
        if self.tracks.count != 0 {
            print("104 ", self.tracks.count)
            let cellTrack = self.tracks[indexPath.item]
            var price: Float = 0.00
            if let unwrappedPrice = cellTrack.trackPrice {
                price = unwrappedPrice
            }
            cell.titleLbl.text = "\(cellTrack.collectionName ?? "") , \(cellTrack.artistName ?? "")"
            cell.detailsLbl.text = "Genre: \(cellTrack.primaryGenreName ?? ""), Price: \(String(describing: price)), Currency: \(cellTrack.currency ?? ""), Release Date: \(cellTrack.releaseDate ?? "")"
            if let urlString = cellTrack.artworkUrl100 {
                DispatchQueue.main.async {
                    cell.imageView.imageDownloader(urlString: urlString)
                }
            } else {
                cell.imageView.image = #imageLiteral(resourceName: "fireBackgroundImage").withRenderingMode(.alwaysOriginal) //handle this error someother way
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: ScreenSize.height * 0.18)
    }
    
    /// Modally bring in DetailScreenController so it comes with a back button on the Navigation Bar
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsScreen = DetailScreenController()
        detailsScreen.track = self.trackList?[indexPath.item] ?? RealmTrack()
        navigationController?.pushViewController(detailsScreen, animated: true)
    }
    
    /// Pagination method - adding the data to the array when index of cell is displayed.
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // Bring in more tracks if were not at the last index of tracks
        if arrayOfTracksIndex <= arrayOfTracksMaxCount - 1{
            if indexPath.item == self.tracks.count - 1 {
                self.perform(#selector(loadMoreDataToCV))
            }
        }
    }
    
    @objc func loadMoreDataToCV() {
        //add max count of array of tracks
        tracks.append(contentsOf: arrayOfTracks[arrayOfTracksIndex])
        arrayOfTracksIndex += 1
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}



