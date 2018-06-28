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
    
    //Dependency Injection
//    init(event: Event) {
//        self.event = event
//        super.init(nibName: nil, bundle: nil)
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
 
    
    var day: Int?
    var month: Int?
    var year: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createEvent)
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(submitButtonTapped(sender:)))
    }
    
    
   
    
    @objc func submitButtonTapped(sender:UIButton) {
        print("Tapped")
    }
    

    
}
