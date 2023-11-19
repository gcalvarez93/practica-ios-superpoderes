//
//  RootviewModel.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 19/11/23.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    @Published var heros: Heroes = []
    @Published var status = Status.none
    
    var testing: Bool
    var suscriptors = Set<AnyCancellable>()
    var viewModel: HeroProtocol
    
    init(
        testing: Bool = false,
        viewModel: HeroProtocol = Hero()
    ) {
        self.viewModel = viewModel
        self.testing = testing
        
        if (testing) {
            getHerosTesting()
        } else {
            getHeros()
        }
    }
        
        
        func getHeros() {
            self.status = .loading
            
            viewModel.getHeros()
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        print(error)
                        self.status = .error(error: "Heros Not Found")
                    case .finished:
                        self.status = .none
                    }
                } receiveValue: { data in
                    self.heros = data.data.results
                }
                .store(in: &suscriptors)
        }
        
        func getHerosTesting() {
            self.status = .loading
            self.heros = getHerosMock()
            self.status = .none
        }
        
         func getHerosMock() -> Heroes {
            
            let hero = Heroe(
                id: 1011334,
                name: "3-D Man",
                description: "",
                modified: "",
                thumbnail: Thumbnail(
                    path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                    thumbnailExtension: "jpg"
                ),
                resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",
                comics: Comics(
                    available: 12,
                    collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                    items: [
                        ComicsItem(
                            resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                            name: "Avengers: The Initiative (2007) #14"
                        )
                    ],
                    returned: 12
                ),
                series: Comics(
                    available: 12,
                    collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                    items: [
                        ComicsItem(
                            resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                            name: "Avengers: The Initiative (2007) #14"
                        )
                    ],
                    returned: 12
                ),
                stories: Stories(
                    available: 12,
                    collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                    items: [
                        StoriesItem(
                            resourceURI: "http://gateway.marvel.com/v1/public/stories/19947",
                            name: "Cover #19947",
                            type: "cover"
                        )
                    ],
                    returned: 12
                ),
                events: Comics(
                    available: 12,
                    collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                    items: [
                        ComicsItem(
                            resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                            name: "Avengers: The Initiative (2007) #14"
                        )
                    ],
                    returned: 12
                ),
                urls: [
                    URLElement(
                        type: "detail",
                        url: "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=808a8a06bb441aba483dd693f6c3056d"
                    )
                ]
            )
            
            let data = HerosResponse(
                code: 0,
                status: "",
                copyright: "",
                attributionText: "",
                attributionHTML: "",
                etag: "",
                data: DataClass(
                    offset: 0,
                    limit: 0,
                    total: 0,
                    count: 0,
                    results: [hero, hero, hero, hero, hero, hero, hero, hero]
                )
            )
            
            return data.data.results
        }
    }
