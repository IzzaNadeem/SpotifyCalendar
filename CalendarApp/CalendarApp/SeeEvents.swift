//
//  EventView.swift
//  CalendarApp
//
//  Created by C4Q on 6/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class EventView: UIView {

    lazy var eventTableView: UITableView = {
        let tv = UITableView()
        
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "EventCell")
    
        return tv
    }()
    
    
}
