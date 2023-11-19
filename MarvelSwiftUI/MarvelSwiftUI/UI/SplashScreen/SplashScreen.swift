//
//  SplashScreen.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 19/11/23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Image(decorative: "Marvel-universe")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .id(0)
            
            Image(decorative: "")
                            .resizable()
                            .background(.black)
                            .opacity(0.6)
            
            ProgressView()
                .scaleEffect(2)
                .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                .id(1)
        }
    }
}

#Preview {
    SplashScreen()
}
