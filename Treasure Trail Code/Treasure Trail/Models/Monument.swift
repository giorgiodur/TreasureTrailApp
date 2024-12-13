//
//  Monument.swift
//  Treasure Trail
//
//  Created by Giorgio Durante on 13/12/24.
//

import Foundation

struct Monument: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let description: String
    let isAlreadyFound: Bool
}
