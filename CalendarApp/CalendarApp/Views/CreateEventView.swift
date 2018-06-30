//
//  createEventView.swift
//  CalendarApp
//
//  Created by C4Q on 6/26/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CreateEventView: UIView {

      lazy var eventDescription: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        textView.isEditable = true
        textView.allowsEditingTextAttributes = true
        textView.font = UIFont.boldSystemFont(ofSize: 16)
        textView.backgroundColor = UIColor.blue
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var startTime: UILabel = {
        let dn = UILabel()
        dn.text = "Start Time" //should be changed in table view
        dn.textAlignment = .center
        dn.textColor = UIColor.darkGray
        dn.font = UIFont(name: "HelveticaNeue-Medium", size: 17)
        dn.translatesAutoresizingMaskIntoConstraints = false
        return dn
    }()
    
    lazy var endTime: UILabel = {
        let dn = UILabel()
        dn.text = "End Time" //should be changed in table view
        dn.textAlignment = .center
        dn.textColor = UIColor.darkGray
        dn.font = UIFont(name: "HelveticaNeue-Medium", size: 17)
        dn.translatesAutoresizingMaskIntoConstraints = false
        return dn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   
    func setupView() {
        self.addSubview(startTime)
        startTime.topAnchor.constraint(equalTo: topAnchor).isActive = true
        startTime.leadingAnchor.constraint(equalTo: leadingAnchor).isActive=true
        startTime.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive=true
       
        self.addSubview(startTimePicker)
        startTimePicker.topAnchor.constraint(equalTo: startTime.bottomAnchor, constant: 2).isActive=true
        startTimePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive=true
        startTimePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive=true
       
        self.addSubview(endTime)
        endTime.topAnchor.constraint(equalTo: startTimePicker.bottomAnchor, constant: 2).isActive = true
        endTime.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        endTime.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        
        self.addSubview(endTimePicker)
        endTimePicker.topAnchor.constraint(equalTo: endTime.bottomAnchor, constant: 2).isActive=true
        endTimePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive=true
        endTimePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive=true
        
        self.addSubview(eventDescription)
        eventDescription.topAnchor.constraint(equalTo: endTimePicker.bottomAnchor, constant: 10).isActive = true
        eventDescription.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
        eventDescription.leadingAnchor.constraint(equalTo:leadingAnchor, constant: 10).isActive=true
        eventDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive=true
    }
    
    lazy var startTimePicker: UIDatePicker = {
        var pickerView = UIDatePicker()
        pickerView = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width))
        pickerView.backgroundColor = UIColor.white
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()

    lazy var endTimePicker: UIDatePicker = {
        var pickerView = UIDatePicker()
        pickerView = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width))
        pickerView.backgroundColor = UIColor.white
        pickerView.translatesAutoresizingMaskIntoConstraints=false
        return pickerView
    }()
}
