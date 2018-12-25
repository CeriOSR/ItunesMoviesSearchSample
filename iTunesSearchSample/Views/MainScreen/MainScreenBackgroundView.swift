//
//  MainScreenBackgroundView.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 22/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import UIKit

// MARK: - Background View for MainScreenController
class MainScreenBackgroundView: UIView {
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "darkGreenGradient").withRenderingMode(.alwaysOriginal)
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(backgroundImage)
        addSubview(blurView)
        
        backgroundImage.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        blurView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}


