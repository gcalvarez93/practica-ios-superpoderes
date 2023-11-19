//
//  HomeRowView.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 19/11/23.
//

import SwiftUI

struct HomeRowView: View {
    var hero: Heroe
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: getImage(data: hero.thumbnail))) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "person")
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
                .opacity(0.4)
                .id(1)
            
            
            HStack {
                
                Spacer()
                
                Text("\(hero.name)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .id(2)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .id(3)
            }
            .padding()
            
        }
        .frame(maxHeight: 250)
        .cornerRadius(20)
        .padding()
    }
    
    private func getImage(data thumbnail: Thumbnail) -> String {
        return "\(thumbnail.path).\(thumbnail.thumbnailExtension)"
    }
}

#Preview {
    HomeRowView(hero: Heroe(
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
    ))
}

