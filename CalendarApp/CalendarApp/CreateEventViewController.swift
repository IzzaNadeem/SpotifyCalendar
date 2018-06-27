//
//  CreateEventViewController.swift
//  CalendarApp
//
//  Created by C4Q on 6/27/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {

    private lazy var createEvent = createEventView(frame: self.view.safeAreaLayoutGuide.layoutFrame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(createEvent)
//        createEvent.endTimePicker.date = Date(timeIntervalSince1970: 0)
        
    }
    
    @objc func tapped() {
        print("Tapped")
    }
    

    
}
