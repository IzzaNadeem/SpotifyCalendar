//
//  EventAPIClient.swift
//  CalendarApp
//
//  Created by C4Q on 6/22/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

enum HTTPVerb: String {
    case GET
    case POST
}

struct EventAPIClient {
    private init() {}
    static let manager = EventAPIClient()

func postEventToServer(event: Event, completionHandler: @escaping (URLResponse) -> Void, errorHandler: @escaping (Error) -> Void) {
    let strURL = "http://localhost:8000/events/"
    guard let url = URL(string: strURL) else {
        errorHandler(AppError.badURL(url: strURL))
        return
    }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    let postString = "description=\(event.description)&startTime=\(event.startTime)&endTime=\(event.endTime)&day=\(event.day)&month=\(event.month)&year=\(event.year)"
    urlRequest.httpBody = postString.data(using: .utf8)
    NetworkHelper.manager.performDataTask(with: urlRequest, completionResponse: { (response) in
        completionHandler(response)
    }, errorHandler: { print($0) })
}
    
    func getEventWith(id: String, completionHandler: @escaping (Event) -> Void, errorHandler: @escaping (Error) -> Void) {
        let strURL = "http://localhost:8000/events/\(id)"
        guard let url = URL(string: strURL) else {
            errorHandler(AppError.badURL(url: strURL))
            return
        }
        let urlRequest = URLRequest(url: url)
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let event = try JSONDecoder().decode(Event.self, from: data)
                completionHandler(event)
            }
            catch {
                errorHandler(AppError.cannotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: urlRequest, completionHandler: completion, errorHandler: errorHandler)
    }
    
    func getAllEvents(completionHandler: @escaping ([Int: [Event]]) -> Void, errorHandler: @escaping (Error) -> Void) {
        let strURL = "http://localhost:8000/events/"
        guard let url = URL(string: strURL) else {
           return errorHandler(AppError.badURL(url: strURL))
        }
        let urlRequest = URLRequest(url: url)
        var eventsDict = [Int: [Event]]()
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let events = try JSONDecoder().decode([Event].self, from: data)
                for event in events {
                    if let eventSoFar = eventsDict[event.day] {
                        var eventsToAdd: [Event] = eventSoFar
                        eventsToAdd.append(event)
                        eventsDict.updateValue(eventsToAdd, forKey: event.day)
                    } else {
                        eventsDict[event.day] = [event]
                    }
                }
                completionHandler(eventsDict)
            } catch {
                errorHandler(AppError.cannotParseJSON(rawError: error))
            }
            
        }
        NetworkHelper.manager.performDataTask(with: urlRequest, completionHandler: completion, errorHandler: errorHandler)
    }
}

