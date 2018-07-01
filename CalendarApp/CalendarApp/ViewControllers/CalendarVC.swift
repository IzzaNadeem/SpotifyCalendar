//
//  ViewController.swift
//  CalendarApp
//
//  Created by C4Q on 6/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController {
     
   var calenderView = CalenderView(frame: CGRect.zero)
   var seeCreatedEventsView = SeeCreatedEventsView(frame: CGRect.zero)
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        self.title = "My Calender"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Event", style: .plain, target: self, action: #selector(addAnEvent(sender:)))
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        calenderView.delegate = self //self is CalenderVC which has been delegate
        self.seeCreatedEventsView.eventTableView.dataSource = self
        loadEvents()
    }
    
    var events = [Int: [Event]]() {
        didSet {
            seeCreatedEventsView.eventTableView.reloadData()
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func loadEvents() {
        EventAPIClient.manager.getAllEvents(completionHandler: { (eventDict) in
            self.events = eventDict
        }) { (error) in
            print(error)
        }
    }
    
    func setupViews() {
        view.addSubview(calenderView)
        view.addSubview(seeCreatedEventsView)
        self.calenderView.backgroundColor = UIColor.darkGray
        self.view.backgroundColor = Style.bgColor
        calenderView.translatesAutoresizingMaskIntoConstraints = false
        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive=true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
        seeCreatedEventsView.topAnchor.constraint(equalTo: calenderView.bottomAnchor).isActive = true
        seeCreatedEventsView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        seeCreatedEventsView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive=true
        seeCreatedEventsView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive=true
        seeCreatedEventsView.translatesAutoresizingMaskIntoConstraints = false
    }
   
    @objc func addAnEvent(sender: UIButton) {
        let destination = CreateEventViewController()
        destination.day = calenderView.currentSelectedDate
        destination.month = 6
        destination.year = 2018
        destination.delegate = self 
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
}

extension CalendarVC: EnableSubmitDelegate {
    func enableSubmitButton() {
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
}

extension CalendarVC: CreateEventViewControllerDelegate {
    func didCreateEvent() {
        loadEvents()
    }
}

extension CalendarVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let unwrappedCurrentSelectedDate = calenderView.currentSelectedDate else {
            return "Day Events"
        }
        return "June \(unwrappedCurrentSelectedDate), 2018"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let UnwrappedcurrentSelectedDate = calenderView.currentSelectedDate else {
            return 0
        }
        return (events[UnwrappedcurrentSelectedDate] ?? []).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let eventCell = tableView.dequeueReusableCell(withIdentifier: "seeEventsCell") as! seeEventsTableViewCell
        let eventCell = tableView.dequeueReusableCell(withIdentifier: "seeEventsCell") as! seeEventsTableViewCell
        guard let unwrappedCurrentSelectDate = calenderView.currentSelectedDate else {
            return UITableViewCell()
        }
        guard let eventsOnSelectedDate = events[unwrappedCurrentSelectDate] else {
            return UITableViewCell()
        }
        let event = eventsOnSelectedDate[indexPath.row]
        eventCell.eventDescription.text = event.description
        eventCell.endTime.text = "endTime: \(event.endTime)"
        eventCell.startTime.text = " startTime: \(event.startTime)"
        
        
        return eventCell
    }
    
}



