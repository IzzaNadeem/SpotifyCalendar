//
//  CreateEventViewController.swift
//  CalendarApp
//
//  Created by C4Q on 6/27/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
protocol CreateEventViewControllerDelegate: class {
    func didCreateEvent()
}
class CreateEventViewController: UIViewController {

    var createEventView = CreateEventView()
    
    private lazy var createEvent = CreateEventView(frame: self.view.safeAreaLayoutGuide.layoutFrame)
    
    var event: Event?
    var day: Int?
    var month: Int?
    var year: Int?
    weak var delegate: CreateEventViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createEvent)
        createEventView.eventDescription.text = "Enter Description"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(submitButtonTapped(sender:)))
    }
    
    
   
    
    @objc func submitButtonTapped(sender:UIButton) {
        guard let day = day, let month = month, let year = year else {
            print("error here")
            return
        }
        let startTime = String(createEventView.startTimePicker.date.timeIntervalSince1970)
        let endTime = String(createEventView.endTimePicker.date.timeIntervalSince1970)
        
        
        let eventToCreate = Event(_id: nil, description: createEventView.eventDescription.text, startTime: startTime, endTime: endTime, day: day, month: month, year: year)
        EventAPIClient.manager.postEventToServer(event: eventToCreate, completionHandler: { (response) in
            print((response as! HTTPURLResponse).statusCode)
            self.delegate?.didCreateEvent()
        }, errorHandler: { print($0) })
        self.navigationController?.popViewController(animated: true)
    }
    

    
}
