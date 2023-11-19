//
//  RootView.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 19/11/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        switch rootViewModel.status {
        case .none:
            withAnimation {
                HomeView()
            }
        case .loading:
            withAnimation {
                SplashScreen()
            }
        case .error(error: let errorString):
            withAnimation {
                ErrorScreen(errorText: errorString)
            }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(RootViewModel())
}
