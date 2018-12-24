//
//  SplashScreen.swift
//  iTunesSearchSample
//
//  Created by Mei on 2018-12-23.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import UIKit
import RealmSwift

class SplashScreenController: UIViewController {
    
    let realm = try! Realm()
    var timer : Timer?
    var isRunning: Bool = false
    var trackList : RealmSwift.Results<RealmTrack>?
    var tracks = [Track]()
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "fireBackgroundImage")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let devNameLabel: UILabel = {
        let label = UILabel()
        guard let customFont = UIFont(name: "Glitzstick", size: 40) else {
            fatalError("""
                Failed to load the "CustomFont-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor(red: 21/255, green: 124/255, blue: 246/255, alpha: 1)
        label.text = "by: CeriOSly"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.trackList = CacheManager.sharedInstance.getDataFromDB()
        prefetchDataForMainScreen(results: self.trackList ?? realm.objects(RealmTrack.self).filter(NSPredicate(value: false)))
        setupViews()
        animateViews()
        if isRunning == false {
            guard timer == nil else {return}
            timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(loadMainScreen), userInfo: nil, repeats: false)
            isRunning = true
        }
    }
    
    func setupViews() {
        
        view.addSubview(logoImageView)
        view.addSubview(devNameLabel)
        logoImageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        devNameLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true
        devNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        devNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        devNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    fileprivate func animateViews() {
        UIView.animate(withDuration: 1.0, delay: 3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.logoImageView.transform = CGAffineTransform(translationX: 0, y: -250)
            self.logoImageView.alpha = 0
            self.devNameLabel.transform = CGAffineTransform(translationX: 0, y: 250)
            self.devNameLabel.alpha = 0
        }) { (_) in
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    /// Pre-Fetching data from URL
    private func prefetchDataForMainScreen(results: RealmSwift.Results<RealmTrack>) {
        if results.count == 0 {
            FetchObjectsFromUrl.sharedInstance.fetchObject { (tracks) in
                if tracks.count > 0 && tracks.count > results.count {
                    self.tracks = tracks
                    for track in self.tracks {
                        TypeConverterViewModel.sharedInstance.assigningObjectToRealmObject(track, { (realmTracks) in
                            CacheManager.sharedInstance.addData(object: realmTracks)
                        })
                    }
                }
            }
        } else {
            for rTrack in results {
                TypeConverterViewModel.sharedInstance.assigningResultsToTracks(rTrack, { (track) in
                    self.tracks.append(track)
                })
            }
            
        }
    }
    
    @objc func loadMainScreen() {
        let mainScreen = MainScreenController()
        if self.tracks.count != 0 {
            print(self.tracks.count)
            let chunckedArray = self.tracks.chunked(into: self.tracks.count / 2)
            print(chunckedArray.count)
            mainScreen.arrayOfTracks = chunckedArray
            mainScreen.tracks = chunckedArray[0]
        }
        self.present(mainScreen, animated: true, completion: {
        })
    }
    
    
    
}
