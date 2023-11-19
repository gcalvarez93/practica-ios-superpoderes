//
//  MarvelSwiftUIApp.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 18/11/23.
//

import SwiftUI

@main
struct MarvelSwiftUIApp: App {
    @StateObject var rootViewModel = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootViewModel)
        }
    }
}
