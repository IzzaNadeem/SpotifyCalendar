//
//  EventModel.swift
//  CalendarApp
//
//  Created by C4Q on 6/22/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct Event: Codable {
    var _id: String?
    var description: String
    var startTime: Double
    var endTime: Double
    var day: Int
    var month: Int
    var year: Int
}
