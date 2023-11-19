//
//  HeroViewModel.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 19/11/23.
//

import Foundation
import Combine

protocol HeroProtocol: AnyObject {
    func getHeros() -> AnyPublisher<HerosResponse, Error>
    func getComics(by id: String) -> AnyPublisher<ComicResponse, Error>
}

final class Hero: HeroProtocol {
    
    let network: Network
    
    init(
        network: Network = Network()
    ) {
        self.network = network
    }
    
    func getHeros() -> AnyPublisher<HerosResponse, Error> {
        return network.callServer(
            type: HerosResponse.self,
            request: network.getHeros()
        )
        
    }
    
    func getComics(by id: String) -> AnyPublisher<ComicResponse, Error> {
        return network.callServer(
            type: ComicResponse.self,
            request: network.getComics(by: id)
        )
    }
}


