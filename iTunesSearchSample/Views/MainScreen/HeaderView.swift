//
//  MainScreenHeaderView.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 22/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import UIKit

// MARK: - Header View for MainScreenController
class HeaderView: UIView {
    
    let headerLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = lbl.font.withSize(25)
        lbl.text = "Movies"
        lbl.textColor = UIColor.white
        return lbl
    }()
    
    let lastVisitTrackLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = lbl.font.withSize(12)
        lbl.textColor = UIColor.white
        lbl.textAlignment = .right
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(dividerView)
        addSubview(headerLabel)
        addSubview(        lastVisitTrackLbl)
        headerLabel.anchor(nil, left: leftAnchor, bottom: dividerView.topAnchor, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 2, rightConstant: 0, widthConstant: ScreenSize.width * 0.25, heightConstant: ScreenSize.height * 0.07)
        lastVisitTrackLbl.anchor(nil, left: nil, bottom: dividerView.topAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: ScreenSize.width * 0.3, heightConstant: ScreenSize.height * 0.08)
        dividerView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 4, rightConstant: 8, widthConstant: 0, heightConstant: 1)
    }
}
