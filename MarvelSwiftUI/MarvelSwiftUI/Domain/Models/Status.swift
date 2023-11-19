//
//  Status.swift
//  MarvelSwiftUI
//
//  Created by Gabriel Castro on 19/11/23.
//

import Foundation

enum Status: Equatable {
    case none, loading, error(error: String)
}
