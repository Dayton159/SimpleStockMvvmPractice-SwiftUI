//
//  StockListViewModel.swift
//  SimpleStockMvvmPractice-SwiftUI
//
//  Created by Dayton on 16/05/21.
//

import Foundation
import SwiftUI

class StockListViewModel: ObservableObject {
     
    @Published var dragOffset: CGSize = CGSize(width: 0, height: 730)
    @Published var searchTerm:String = ""
    @Published var stocks:[StockViewModel] = [StockViewModel]()
    @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
   
    func load() {
        fetchNews()
        fetchStocks()
    }
    
    private func fetchNews() {
        WebService.getTopNews { articles in
            
            guard let safeArticles = articles else { return }
            
            self.news = safeArticles.map { NewsArticleViewModel(article: $0) }
        }
    }
    
    private func fetchStocks() {
        WebService.getStocks { stocks in
            
            guard let safeStocks = stocks else {return}
            
            DispatchQueue.main.async {
                self.stocks = safeStocks.map(StockViewModel.init)
            }
        }
    }
}
