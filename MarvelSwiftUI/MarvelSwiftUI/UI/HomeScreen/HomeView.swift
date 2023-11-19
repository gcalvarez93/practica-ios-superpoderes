//
//  HomeView.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 19/11/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: RootViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.heros) { hero in
                    NavigationLink {
                        DetailScreen(viewModel: DetailViewModel(id: hero.id))
                    } label: {
                        HomeRowView(hero: hero)
                    }
                }
            }
            .navigationTitle("Marvel Heroes")
            .id(0)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(RootViewModel(testing: true))
}
