//
//  ContentView.swift
//  SimpleStockMvvmPractice-SwiftUI
//
//  Created by Dayton on 16/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListViewModel = StockListViewModel()
    
    init() {
        let appearance = UINavigationBarAppearance()
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .black
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .black
        UITableViewCell.appearance().backgroundColor = .black
        
        stockListViewModel.load()
    }
    
    var body: some View {
        
        let filteredStocks = self.stockListViewModel.searchTerm.isEmpty ? self.stockListViewModel.stocks : self.stockListViewModel.stocks.filter { $0.symbol.starts(with: self.stockListViewModel.searchTerm )}
        
        return NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                
                Text("May 16 2021")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -340)
                
                SearchView(searchTerm: self.$stockListViewModel.searchTerm)
                    .offset(y: -290)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 200)
                    
                
                NewsArticleView(newsArticles: self.stockListViewModel.news,
                    onDragBegin: { value in
                        self.stockListViewModel.dragOffset = value.translation
                 }, onDragEnd: { value in
                    if value.translation.height < 0 {
                        //Dragged upward
                        self.stockListViewModel.dragOffset = CGSize(width: 0, height: 200)
                    } else {
                        // Dragged downward
                        self.stockListViewModel.dragOffset = CGSize(width: 0, height: 730)
                    }
                 })
                    .animation(.spring())
                    .offset(y: self.stockListViewModel.dragOffset.height)
            }
            .navigationTitle("Stocks")
            
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
