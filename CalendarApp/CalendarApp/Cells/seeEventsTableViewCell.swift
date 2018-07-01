//
//  seeEventsTableViewCell.swift
//  CalendarApp
//
//  Created by C4Q on 6/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class seeEventsTableViewCell: UITableViewCell {
    
    lazy var startTime: UILabel = {
        let label = UILabel()
        label.text = "start time"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var endTime: UILabel = {
        let label = UILabel()
        label.text = "end time"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var eventDescription: UILabel = {
        let label = UILabel()
        label.text = "description"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.black
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "seeEventsCell")
        contentView.backgroundColor = UIColor.blue
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    func setupViews() {
        addSubview(eventDescription)
        addSubview(startTime)
        addSubview(endTime)
        eventDescription.topAnchor.constraint(equalTo: topAnchor).isActive=true
        eventDescription.leadingAnchor.constraint(equalTo: leadingAnchor).isActive=true
        eventDescription.trailingAnchor.constraint(equalTo: trailingAnchor).isActive=true
        eventDescription.translatesAutoresizingMaskIntoConstraints=false
        startTime.topAnchor.constraint(equalTo: eventDescription.bottomAnchor, constant:2).isActive=true
        startTime.leadingAnchor.constraint(equalTo: leadingAnchor).isActive=true
        startTime.trailingAnchor.constraint(equalTo: trailingAnchor).isActive=true
        startTime.translatesAutoresizingMaskIntoConstraints=false
        endTime.topAnchor.constraint(equalTo: startTime.bottomAnchor, constant:2).isActive=true
        endTime.leadingAnchor.constraint(equalTo: leadingAnchor).isActive=true
        endTime.trailingAnchor.constraint(equalTo: trailingAnchor).isActive=true
        endTime.translatesAutoresizingMaskIntoConstraints=false
        
    }
}
