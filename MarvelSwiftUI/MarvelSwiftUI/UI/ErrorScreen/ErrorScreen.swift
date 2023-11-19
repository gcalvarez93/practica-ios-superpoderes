//
//  ErrorView.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 19/11/23.
//

import SwiftUI

struct ErrorScreen: View {
    var errorText: String
    
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
            
            VStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding()
                    .id(1)
                
                
                Text(errorText)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .id(2)
            }
        }
    }
}

#Preview {
    ErrorScreen(errorText: "Test Error")
}
