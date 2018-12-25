//
//  DetailScreenController.swift
//  iTunesSearchSample
//
//  Created by Mei on 2018-12-23.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import UIKit
import RealmSwift

//MARK: - Displays the details of selected track.
class DetailScreenController: UIViewController {
    
    let backgroundView = BackgroundView()
    let detailsView = DetailsView()

    /// Closure that auto loads the track details into the views.
    var track = RealmTrack() {
        didSet{
            DispatchQueue.main.async {
                if let imageUrl = self.track.artworkUrl100,
                    let trackName = self.track.trackName,
                    let artistName = self.track.artistName,
                    let kind = self.track.kind,
                    let trackCensoredName = self.track.trackCensoredName,
                    let primaryGenreName = self.track.primaryGenreName,
                    let previewUrl = self.track.previewUrl,
                    let collectionName = self.track.collectionName,
                    let collectionCensoredName = self.track.collectionCensoredName,
                    let collectionExplicitness = self.track.collectionExplicitness,
                    let trackExplicitness = self.track.trackExplicitness,
                    let releaseDate = self.track.releaseDate,
                    let country = self.track.country,
                    let currency = self.track.currency,
                    let isStreamable = self.track.isStreamable.value {
                    let splitDate = releaseDate.split(separator: "T")
                    self.detailsView.trackImageView.imageDownloader(urlString: imageUrl)
                    self.detailsView.firstDetailsLbl.text = "\(String(describing: trackName))\n\(String(describing: artistName))\n\(String(describing: kind))\n\(String(describing: trackCensoredName))\n\(String(describing: primaryGenreName))\n\(String(describing: previewUrl))"
                    self.detailsView.secondDetailsLbl.text = "\(String(describing: collectionName))\n\(String(describing: collectionCensoredName))\n\(String(describing: collectionExplicitness))\n\(String(describing: trackExplicitness))\n\(String(describing: splitDate[0]))\n\(String(describing: country))\n\(String(describing: currency))\nStreamable: \(String(describing: isStreamable))\n"
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    /// Hide the Navigation Bar when we go back to main screen.
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    /// Setting up the views for the Details viewController
    private func setupViews() {
        title = "Details"
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        view.addSubview(detailsView)

        backgroundView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        detailsView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}
