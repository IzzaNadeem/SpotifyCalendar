//
//  NetworkHelper.swift
//  CalendarApp
//
//  Created by C4Q on 6/22/18.
//  Copyright © 2018 C4Q. All rights reserved.

import Foundation

enum AppError: Error {
    case badURL(url: String)
    case badImageURL(url: String)
    case badData
    case badResponseCode(code: Int)
    case cannotParseJSON(rawError: Error)
    case noInternet
    case noResponse
    case other(rawError: Error)
}

class NetworkHelper {
    private init () {}
    static let manager = NetworkHelper()
    private let session = URLSession(configuration: .default)
    
    func performDataTask(with urlRequest: URLRequest, completionHandler: @escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        session.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async{
                if let error = error as? URLError {
                    print(error)
                    switch error {
                    case URLError.notConnectedToInternet:
                        errorHandler(AppError.noInternet)
                    default:
                        errorHandler(AppError.other(rawError: error))
                    }
                    return
                }
                
                if let data = data {
                    completionHandler(data)
                }
            }
            }.resume()
    }
    
    func performDataTask(with request: URLRequest, completionResponse: @escaping (URLResponse) -> Void, errorHandler: @escaping (Error) -> Void) {
        self.session.dataTask(with: request){(data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                guard let response = response else {
                    errorHandler(AppError.noResponse)
                    return
                }
                if let error = error {
                    errorHandler(error)
                }
                completionResponse(response)
            }
            }.resume()
    }
}
