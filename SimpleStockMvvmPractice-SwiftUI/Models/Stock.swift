//
//  Stock.swift
//  SimpleStockMvvmPractice-SwiftUI
//
//  Created by Dayton on 16/05/21.
//

import Foundation

struct Stock:Decodable {
    let symbol:String
    let description:String
    let price:Double
    let change:String
}
