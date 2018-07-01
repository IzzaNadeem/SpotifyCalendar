//
//  EventView.swift
//  CalendarApp
//
//  Created by C4Q on 6/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SeeCreatedEventsView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(eventTableView)
        eventTableView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        eventTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive=true
        eventTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive=true
        eventTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
        eventTableView.translatesAutoresizingMaskIntoConstraints=false
    }
    
    lazy var eventTableView: UITableView = {
        let tv = UITableView()
        tv.register(seeEventsTableViewCell.self, forCellReuseIdentifier: "seeEventsCell")
        tv.backgroundColor = UIColor.blue
        return tv
    }()
    
    
}
