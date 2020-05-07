//
//  usernameSearchCell.swift
//  foreshadow
//
//  Created by Ebuka Egbunam on 5/7/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import Foundation

import UIKit


class UsernameCell : UITableViewCell {
    
    let profileimage = UIImageView()
    let usernameLabel = UILabel()
    let name = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileimage)
        addSubview(usernameLabel)
        addSubview(name)
        setupimageView()
        setupusername()
        setupname()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupLabels(data : Dj){
        name.text = "\(data.firstname) \(data.lastname)"
        usernameLabel.text = "\(data.username)"
    }
    
    
    
     func setupimageView(){
        profileimage.frame = CGRect(x: 10, y: 10, width: 30, height: 30)
        profileimage.layer.cornerRadius = 0.5 * (profileimage.frame.width)
        profileimage.backgroundColor = .lightGray
        profileimage.clipsToBounds = true
        
    }
    

    
     private func setupusername(){
        usernameLabel.frame = CGRect(x: 75, y: 5, width: 150, height: 20)
        usernameLabel.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.name: "ArialRoundedMTBold"]), size: 12)
        usernameLabel.clipsToBounds = true
        usernameLabel.text = "username"
        usernameLabel.numberOfLines = 0
    }
    
    
     private func setupname(){
        name.frame = CGRect(x: 75, y: 30, width: 150, height: 20)
        name.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.name: "ArialRoundedMTBold"]), size: 12)
        name.clipsToBounds = true
        name.text = "Firstname Lastname"
        name.numberOfLines = 0
        name.textAlignment = .left
        
    }
    
}
