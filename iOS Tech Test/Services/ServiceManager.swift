//
//  ServiceManager.swift
//  iOS Tech Test
//
//  Created by Nikunj Gangani on 13/01/23.
//

import Foundation

enum ServiceError: Error {
    case noData
    case invalidURL
    case error(error: Error)
}

protocol ServiceSession {
    func getWebService(url: URL, completionHandler: @escaping ((Result<Data, ServiceError>) -> Void))
}

extension URLSession: ServiceSession {
    func getWebService(url: URL, completionHandler: @escaping ((Result<Data, ServiceError>) -> Void)){
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completionHandler(.failure(.invalidURL))
                return
            }
            completionHandler(.success(data))
        }
        dataTask.resume()
    }
    
}

class ServiceManager {
    private let session: ServiceSession
    init(session: ServiceSession = URLSession.shared) {
        self.session = session
    }
    
    func getWebService(url: URL, completionHandler: @escaping ((Result<Data, ServiceError>) -> Void)) {
        session.getWebService(url: url, completionHandler: completionHandler)
    }
    
}

