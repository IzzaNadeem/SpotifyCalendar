//
//  seeEventsTableViewCell.swift
//  CalendarApp
//
//  Created by C4Q on 6/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class seeEventsTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "seeEventsCell")
        
        contentView.backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
