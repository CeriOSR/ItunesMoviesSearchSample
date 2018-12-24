//
//  DetailScreenController.swift
//  iTunesSearchSample
//
//  Created by Mei on 2018-12-23.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import UIKit

class DetailScreenController: UIViewController {
    
    let backgroundView = MainScreenBackgroundView()
    var details = Track() {
        didSet{
            if let imageUrl = self.details.artworkUrl100 {
                self.trackImageView.imageDownloader(urlString: imageUrl)
            }
        }
    }
    
    let trackImageView : UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.image = #imageLiteral(resourceName: "fireBackgroundImage").withRenderingMode(.alwaysOriginal)
        view.contentMode = .scaleToFill
        return view
    }()
    
    let firstDetailsLbl: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .blue
        return lbl
    }()
    
    let secondDetailsLbl: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .red
        return lbl
    }()
    
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
        view.addSubview(trackImageView)
        view.addSubview(firstDetailsLbl)
        view.addSubview(secondDetailsLbl)
        backgroundView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        trackImageView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 8, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: ScreenSize.height * 0.5)
        firstDetailsLbl.anchor(trackImageView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 4, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: ScreenSize.height * 0.2)
        secondDetailsLbl.anchor(firstDetailsLbl.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 4, leftConstant: 10, bottomConstant: 4, rightConstant: 10, widthConstant: 0, heightConstant: 0)
    }
    
}
