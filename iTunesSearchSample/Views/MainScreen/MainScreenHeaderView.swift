//
//  MainScreenHeaderView.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 22/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import UIKit

class MainScreenHeaderView: UIView {
    
    let headerLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = lbl.font.withSize(25)
        lbl.text = "Movies"
        lbl.textColor = UIColor.white
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
        headerLabel.anchor(nil, left: leftAnchor, bottom: dividerView.topAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 4, rightConstant: 8, widthConstant: 0, heightConstant: ScreenSize.height * 0.07)
        dividerView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 4, rightConstant: 8, widthConstant: 0, heightConstant: 1)
        
    }
    
    @objc func handleSearchButtonTapped() {
        print("Handle Search Button Tapped")
    }
    
}
