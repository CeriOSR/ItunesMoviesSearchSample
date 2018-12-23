//
//  MainScreenCollectionViewCell.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 21/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import UIKit

class MainScreenCollectionViewCell: BaseCell {
    
    let dividerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 6
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
    
    let detailsLbl: UILabel = {
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
        addSubview(detailsLbl)
        addSubview(dividerView)
        dividerView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 2, rightConstant: 8, widthConstant: 0, heightConstant: 1)
        imageView.anchor(topAnchor, left: leftAnchor, bottom: dividerView.topAnchor, right: nil , topConstant: 4, leftConstant: 4, bottomConstant: 4, rightConstant: 0, widthConstant: ScreenSize.width * 0.175, heightConstant: 0)
        titleLbl.anchor(topAnchor, left: imageView.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 4, widthConstant: 0, heightConstant: self.frame.height * 0.5)
        detailsLbl.anchor(titleLbl.bottomAnchor, left: imageView.rightAnchor, bottom: dividerView.topAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 4, rightConstant: 4, widthConstant: 0, heightConstant: 0)
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
