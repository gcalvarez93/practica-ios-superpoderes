//
//  Network.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 19/11/23.
//

import Foundation
import CryptoKit
import Combine


let urlBase = "https://gateway.marvel.com"
let ts = "1"
let orderBy = "modified"


// Second
let apiKey = "4d72502ffbd31d392959cf1d389e69f3"
let privateApiKey = "7350a2bcb6561e5344b2a1f93f31f0af26ae1e7a"

enum endpoints: String {
    case characters = "/v1/public/characters"
}

struct Network {
    func getHeros() -> URLRequest {
        let hashKey = MD5(string: "\(ts)\(privateApiKey)\(apiKey)")
        
        var urlCad = "\(urlBase)\(endpoints.characters.rawValue)?"
        urlCad += "apikey=\(apiKey)"
        urlCad += "&ts=\(ts)"
        urlCad += "&hash=\(hashKey)"
        
        var request: URLRequest = URLRequest(url: URL(string: urlCad)!)
        
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
    func getComics(by id: String) -> URLRequest {
        let hashKey = MD5(string: "\(ts)\(privateApiKey)\(apiKey)")
        
        var urlCad = "\(urlBase)\(endpoints.characters.rawValue)/\(id)/comics?"
        urlCad += "apikey=\(apiKey)"
        urlCad += "&ts=\(ts)"
        urlCad += "&hash=\(hashKey)"
        
        print("URL COMICS: \(urlCad)")
        
        var request: URLRequest = URLRequest(url: URL(string: urlCad)!)
        
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
    private func MD5(string: String) -> String {
        let summary = Insecure.MD5.hash(data: Data(string.utf8))

        return summary.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    func callServer<T>(type: T.Type, request: URLRequest) -> AnyPublisher<T, Error> where T : Decodable {
        URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
