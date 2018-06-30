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
     //   self.backgroundColor=UIColor.red
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
    lazy var eventTableView: UITableView = {
        let tv = UITableView()
        
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "seeEventsCell")
    
        return tv
    }()
    
    
}

