//
//  StockViewModel.swift
//  SimpleStockMvvmPractice-SwiftUI
//
//  Created by Dayton on 16/05/21.
//

import Foundation

struct StockViewModel {
    
    let stock:Stock
    
    var symbol: String {
        return self.stock.symbol.uppercased()
    }
    
    var description:String {
        return self.stock.description
    }
    
    var price:String {
        return String(format: "%.2f", self.stock.price)
    }
    
    var change:String {
        self.stock.change
    }
}
