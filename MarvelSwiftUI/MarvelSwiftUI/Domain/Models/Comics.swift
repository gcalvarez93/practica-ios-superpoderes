//
//  Comics.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 19/11/23.
//

import Foundation

// MARK: - ComicResponse
struct ComicResponse: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClassComic
}

// MARK: - DataClass
struct DataClassComic: Codable {
    let offset, limit, total, count: Int
    let results: [Comic]
}

// MARK: - Result
struct Comic: Codable, Identifiable {
    let id: Int
    let digitalID: Int?
    let title: String
    let issueNumber: Int
    let variantDescription: String
    let description: String?
    let modified, isbn, upc, diamondCode: String
    let ean, issn: String
    let format: String
    let pageCount: Int
    let textObjects: [TextObject]
    let resourceURI: String
    let urls: [URLElementComic]
    let series: SeriesComic
    let variants: [SeriesComic]
    let dates: [DateElement]
    let prices: [Price]
    let thumbnail: ThumbnailComic
    let images: [ThumbnailComic]
    let creators: Creators
    let characters: HeroeComic
    let stories: StoriesComic
    let events: HeroeComic
}

// MARK: - Heroes
struct HeroeComic: Codable {
    let available: Int
    let collectionURI: String
    let items: [SeriesComic]
    let returned: Int
}

// MARK: - Series
struct SeriesComic: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Creators
struct Creators: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItem]
    let returned: Int
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    let resourceURI: String
    let name: String
    let role: String
}

// MARK: - DateElement
struct DateElement: Codable {
    let type: String
    let date: String
}

// MARK: - Thumbnail
struct ThumbnailComic: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - Price
struct Price: Codable {
    let type: String
    let price: Double
}

// MARK: - Stories
struct StoriesComic: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItemComic]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItemComic: Codable {
    let resourceURI: String
    let name: String
    let type: String
}

// MARK: - TextObject
struct TextObject: Codable {
    let type: String
    let language: String
    let text: String
}

// MARK: - URLElement
struct URLElementComic: Codable {
    let type: String
    let url: String
}
