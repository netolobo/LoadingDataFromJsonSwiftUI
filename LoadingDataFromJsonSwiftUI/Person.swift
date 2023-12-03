//
//  Person.swift
//  LoadingDataFromJsonSwiftUI
//
//  Created by Neto Lobo on 03/12/23.
//

import Foundation

struct Person : Identifiable, Codable {
    let id: Int
    let first: String
    let last: String
}
