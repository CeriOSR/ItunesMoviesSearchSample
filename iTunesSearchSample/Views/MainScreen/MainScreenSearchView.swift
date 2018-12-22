//
//  MainScreenSearchView.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 22/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import UIKit

class MainScreenSearchView: UIView {
    
    let searchTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Search music..."
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "findIcon2").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleSearchButtonTapped), for: .touchUpInside)
        return button
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
        addSubview(searchTextField)
        addSubview(searchButton)
        addSubview(dividerView)
        
        searchTextField.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 4, leftConstant: 8, bottomConstant: 0, rightConstant: 60, widthConstant: 0, heightConstant: 30)
        searchButton.anchor(topAnchor, left: searchTextField.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 30)
        dividerView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 4, rightConstant: 8, widthConstant: 0, heightConstant: 1)
        
    }
    
    @objc func handleSearchButtonTapped() {
        print("Handle Search Button Tapped")
    }
    
}
