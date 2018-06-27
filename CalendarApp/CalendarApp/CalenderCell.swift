//
//  CalenderCell.swift
//  CalendarApp
//
//  Created by C4Q on 6/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class dateCVCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor=UIColor.clear
        layer.cornerRadius=5
        layer.masksToBounds=true
        
        setupViews()
    }
    
    func setupViews() {
        
        addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: topAnchor).isActive=true
        dateLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
    }
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
