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
}


//here is where you're create a "note" change it to event here
// note_routes.js
//module.exports = function(app, db) {
//    app.get('/notes/:id', (req, res) => {
//
//        });
//    app.post('/notes', (req, res) => {
//        const note = { text: req.body.body, title: req.body.title };
//        db.collection('notes').insert(note, (err, result) => { //HERE DB.COLLECTION('event')
//            if (err) {
//                res.send({ 'error': 'An error has occurred' });
//            } else {
//                res.send(result.ops[0]);
//            }
//            });
//        });
//};
//
