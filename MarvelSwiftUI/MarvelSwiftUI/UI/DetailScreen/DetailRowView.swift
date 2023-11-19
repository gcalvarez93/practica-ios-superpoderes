//
//  DetailRowView.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 19/11/23.
//

import SwiftUI

struct DetailRowView: View {
    var comic: Comic
    
    var body: some View {
        ZStack(alignment: .center) {
            AsyncImage(url: URL(string: getImage(data: comic.thumbnail))) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .background(.gray)
                    .cornerRadius(20)
                    .frame(width: 150, height: 150)
            }
            .id(0)
            
            Image(decorative: "")
                .resizable()
                .background(.black)
                .opacity(0.6)
                .id(0)
            
            VStack(alignment: .center) {
                Text(comic.title)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .padding([.bottom], 20)
                    .id(1)
                
                Text(comic.description ?? "")
                    .font(.body)
                    .foregroundColor(.white)
                    .id(2)
                
                Spacer()
            }
            .frame(maxHeight: 450)
            .padding()
        }
        .frame(maxHeight: 500)
        .cornerRadius(20)
        .padding()
    }
    
    private func getImage(data thumbnail: ThumbnailComic) -> String {
        return "\(thumbnail.path).\(thumbnail.thumbnailExtension)"
    }
}

#Preview {
    DetailRowView(comic: Comic(
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
    ))
}

