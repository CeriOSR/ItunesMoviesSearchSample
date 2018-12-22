//
//  MainScreenCollectionViewCell.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 21/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import UIKit

class MainScreenCollectionViewCell: BaseCell {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "fireBackgroundImage").withRenderingMode(.alwaysOriginal)
        return image
    }()
    let titleLbl : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.backgroundColor = .clear
        return lbl
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
        addSubview(titleLbl)
        imageView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 25, bottomConstant: 80, rightConstant: 25, widthConstant: 0, heightConstant: 0)
        titleLbl.anchor(imageView.bottomAnchor, left: imageView.leftAnchor, bottom: bottomAnchor, right: imageView.rightAnchor, topConstant: 2, leftConstant: 0, bottomConstant: 2, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}
