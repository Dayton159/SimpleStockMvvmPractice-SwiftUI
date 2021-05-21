//
//  WebService.swift
//  SimpleStockMvvmPractice-SwiftUI
//
//  Created by Dayton on 16/05/21.
//

import Foundation

class WebService {
    
    static func getTopNews(completion: @escaping (([Article]?) -> Void)) {
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
            fatalError("URL is incorrect")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let safeData = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            do {
                let articles = try JSONDecoder().decode([Article].self, from: safeData)
                DispatchQueue.main.async {
                    completion(articles)
                }
            }catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
            
        }.resume()
    }
    
    
    
    static func getStocks(completion: @escaping ([Stock]?) -> Void) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("URL is incorrect")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let safeData = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            do {
                let stocks = try JSONDecoder().decode([Stock].self, from: safeData)
                DispatchQueue.main.async {
                    completion(stocks)
                }
                
            }catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}
