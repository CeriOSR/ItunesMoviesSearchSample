//
//  DetailsView.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 25/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import UIKit

//MARK: - View container for all the views in DetailsViewController
class DetailsView: UIView {
    let trackImageView : UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.image = #imageLiteral(resourceName: "fireBackgroundImage").withRenderingMode(.alwaysOriginal)
        view.contentMode = .scaleToFill
        return view
    }()
    
    let firstDetailsLbl: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = lbl.font.withSize(20)
        return lbl
    }()
    
    let secondDetailsLbl: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .white
        lbl.textAlignment = .center
        return lbl
    }()
    
    let detailsView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(detailsView)
        detailsView.addSubview(trackImageView)
        detailsView.addSubview(firstDetailsLbl)
        detailsView.addSubview(secondDetailsLbl)
        
        detailsView.fillSuperview()
        trackImageView.anchor(detailsView.topAnchor, left: detailsView.leftAnchor, bottom: nil, right: detailsView.rightAnchor, topConstant: 8, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: ScreenSize.height * 0.4)
        firstDetailsLbl.anchor(trackImageView.bottomAnchor, left: detailsView.leftAnchor, bottom: nil, right: detailsView.rightAnchor, topConstant: 4, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: ScreenSize.height * 0.2)
        secondDetailsLbl.anchor(firstDetailsLbl.bottomAnchor, left: detailsView.leftAnchor, bottom: detailsView.bottomAnchor, right: detailsView.rightAnchor, topConstant: 4, leftConstant: 20, bottomConstant: 4, rightConstant: 20, widthConstant: 0, heightConstant: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
