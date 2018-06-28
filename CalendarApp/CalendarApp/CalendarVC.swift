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
  
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calenderView.backgroundColor = UIColor.darkGray
        self.title = "My Calender"
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = Style.bgColor
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Event", style: .plain, target: self, action: #selector(addAnEvent(sender:)))
        self.navigationItem.rightBarButtonItem?.isEnabled = false 
        view.addSubview(calenderView)
        calenderView.delegate = self
        calenderView.translatesAutoresizingMaskIntoConstraints = false
        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive=true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    
   
    @objc func addAnEvent(sender: UIButton) {
        let destination = CreateEventViewController()
        destination.day = calenderView.currentSelectedDate
        destination.month = 6
        destination.year = 2018
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
}

extension CalendarVC: EnableSubmitDelegate {
    func enableSubmitButton() {
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
}
