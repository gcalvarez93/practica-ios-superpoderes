//
//  DetailViewModel.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 19/11/23.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
    @Published var comics: [Comic] = []
    
    var suscriptors = Set<AnyCancellable>()
    
    var viewModel: HeroProtocol
    
    init(
        id: Int,
        testing: Bool = false,
        viewModel: HeroProtocol = Hero()
    ) {
        self.viewModel = viewModel
        
        if (testing) {
            getComicsMock()
        } else {
            getComicsFromNetwork(by: id)
        }
    }
    
    private func getComicsFromNetwork(by id: Int) {
        self.comics = []
        
        viewModel.getComics(by: String(id))
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("Success")
                }
            } receiveValue: { data in
                self.comics = data.data.results
            }
            .store(in: &suscriptors)
    }
    
    
    private func getComicsMock() {
        let comicFake = Comic(
            id: 1,
            digitalID: 1,
            title: "Title",
            issueNumber: 1,
            variantDescription: "",
            description: "Text",
            modified: "",
            isbn: "",
            upc: "",
            diamondCode: "",
            ean: "",
            issn: "",
            format: "",
            pageCount: 1,
            textObjects: [],
            resourceURI: "",
            urls: [],
            series: SeriesComic(resourceURI: "", name: ""),
            variants: [],
            dates: [],
            prices: [],
            thumbnail: ThumbnailComic(path: "http://i.annihil.us/u/prod/marvel/i/mg/d/03/58dd080719806", thumbnailExtension: "jpg"),
            images: [],
            creators: Creators(available: 1, collectionURI: "", items: [], returned: 1),
            characters: HeroeComic(available: 1, collectionURI: "", items: [], returned: 1),
            stories: StoriesComic(available: 1, collectionURI: "", items: [], returned: 1),
            events: HeroeComic(available: 1, collectionURI: "", items: [], returned: 1)
        )
        
        self.comics = [comicFake, comicFake, comicFake, comicFake, comicFake, comicFake]
    }
}

