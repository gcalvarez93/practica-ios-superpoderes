//
//  MarvelSwiftUITests.swift
//  MarvelSwiftUITests
//
//  Created by Gabriel Castro on 18/11/23.
//

import XCTest
import ViewInspector
@testable import MarvelSwiftUI

final class MarvelSwiftUITests: XCTestCase {

    func splashScreenTest() throws {
        
        let view = SplashScreen()
        
        // Image Test
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
        
        // Progress view
        let progressView = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(progressView)
    }
    
    func homeViewTest() throws {
        
        let view = HomeView()
            .environmentObject(RootViewModel(testing: true))
        
        let items = try view.inspect().count
        XCTAssertEqual(1, items)
        
        // Scroll
        let scroll = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(scroll)
    }
    
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

    func homeRowViewTest() throws {
        
        let view = HomeRowView(hero: hero)
        
        // Background View
        let background = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(background)
        
        let black_color = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(black_color)
        
        // Text View
        let text = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(text)
        
        // Image View
        let image = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(image)
    }
    
    func detailScreenTest() throws {
        
        let view = DetailScreen(viewModel: DetailViewModel(id: 1, testing: true))
        
        let items = try view.inspect().count
        XCTAssertEqual(1, items)
        
        // ScrollView
        let scroll = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(scroll)
    }
    
    let comic = Comic(
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
    
    func detailRowViewTest() throws {
        
        let view = DetailRowView(comic: comic)
        
        // Background View
        let background = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(background)
        
        let blackColor = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(blackColor)
        
        // Title
        let title = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(title)
        
        // Text
        let description = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(description)
    }
    
    func detailViewModelTest() {
     
        let vm = DetailViewModel(id: 1, testing: true)
        
        // 4 Mock Comics
        XCTAssertEqual(4, vm.comics.count)
        
        // Correct Comic
        let comicName = vm.comics.first?.title
        XCTAssertEqual("Title", comicName)
        
    }
    
    func errorTest() throws {
        
        let view = ErrorScreen(errorText: "Error Test")
        
        // Image View
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
        
        // Icon
        let icon = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(icon)
        
        // Error Text
        let errorText = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(errorText)
        
        let text = try errorText.text().string()
        XCTAssertEqual(text, "Error Test")
    }
    
    func rootViewTest() throws {
        
        let view = RootView()
            .environmentObject(RootViewModel(testing: true))
        
        let pages = try view.inspect().count
        XCTAssertEqual(1, pages)
    }
    
    func rootViewodelTest() {
        let vm = RootViewModel(testing: true)
        
        // 4 mock Character
        XCTAssertEqual(4, vm.heros.count)
        
        // Correct Hero Name
        let heroName =  vm.heros.first?.name
        XCTAssertEqual("3-D Man", heroName)
    }
    
    let network = Network()
    
    func testGetComics() {
        let request = network.getComics(by: "1")
        
        XCTAssertEqual("GET", request.httpMethod)
        
        XCTAssertTrue(((request.url?.absoluteString
            .contains("https://gateway.marvel.com/v1/public/characters/1/comics")) != nil))
    }
    
    func testGetHeros() {
        let request = network.getHeros()
        
        XCTAssertEqual("GET", request.httpMethod)
        
        XCTAssertTrue(((request.url?.absoluteString
            .contains("https://gateway.marvel.com/v1/public/characters")) != nil))
    }
}

