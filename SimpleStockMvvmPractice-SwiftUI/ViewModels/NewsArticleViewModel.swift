//
//  NewsArticleViewModel.swift
//  SimpleStockMvvmPractice-SwiftUI
//
//  Created by Dayton on 18/05/21.
//

import Foundation

struct NewsArticleViewModel {
    let article:Article
    
    
    var imageURL:String {
        return self.article.imageURL
    }
    
    var title:String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
}
