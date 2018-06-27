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

//struct EventAPIClient {
//    private init() {}
//    static let manager = EventAPIClient()
//    func getEvent(completionHandler: @escaping ([Event]) -> Void,
//                     errorHandler: @escaping (Error) -> Void) {
//        let urlStr = "http://localhost:8000/notes/"
//        guard let authenticatedRequest = buildAuthRequest(from: urlStr, httpVerb: .GET) else { errorHandler(AppError.badURL); return }
//        let parseDataIntoEventArr = {(data: Data) in
//            do {
//                let onlineEvent = try JSONDecoder().decode([Event].self, from: data)
//                completionHandler(onlineEvent)
//            }
//            catch let error {
//                errorHandler(AppError.codingError(rawError: error))
//            }
//        }
//        NetworkHelper.manager.performDataTask(with: authenticatedRequest, completionHandler: parseDataIntoFavoriteArr, errorHandler: errorHandler)
//    }
//    func post(event: Event, errorHandler: @escaping (Error) -> Void) {
//        let urlStr = "http://localhost:8000/events/\(id)"
//        guard var authPostRequest = buildAuthRequest(from: urlStr, httpVerb: .POST) else {errorHandler(AppError.badURL); return }
//        do {
//            let encodedEvent = try JSONEncoder().encode(event)
//            authPostRequest.httpBody = encodedEvent
//            NetworkHelper.manager.performDataTask(with: authPostRequest,
//                                                  completionHandler: {_ in print("Made a post request")},
//                                                  errorHandler: errorHandler)
//        }
//        catch {
//            errorHandler(AppError.codingError(rawError: error))
//        }
//
//
//    }
//    
//    func getEvent(id: String)
//}

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
