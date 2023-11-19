//
//  DetailScreen.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 19/11/23.
//

import SwiftUI

struct DetailScreen: View {
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        ScrollView {
            if viewModel.comics.isEmpty {
                ProgressView()
            } else {
                ForEach(self.viewModel.comics) { comic in
                    DetailRowView(comic: comic)
                }
            }
        }
        .id(0)
    }
}

#Preview {
    DetailScreen(viewModel: DetailViewModel(id: 1, testing: true))
}
