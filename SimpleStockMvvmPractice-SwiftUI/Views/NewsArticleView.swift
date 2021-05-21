//
//  NewsArticleView.swift
//  SimpleStockMvvmPractice-SwiftUI
//
//  Created by Dayton on 19/05/21.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let newsArticles: [NewsArticleViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    var body: some View {
        
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            
            HStack {
            VStack(alignment: .leading) {
                Text("Top News")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(2)
                    
                
                Text("From News")
                    .foregroundColor(.gray)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(2)
            }
                
                Spacer()
                
            }.padding()
            .contentShape(Rectangle())
            .gesture(DragGesture()
                        .onChanged(self.onDragBegin)
                        .onEnded(self.onDragEnd))
                
                ScrollView {
                    VStack {
                        ForEach(self.newsArticles, id: \.title) { article in
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(article.publication)
                                        .foregroundColor(.white)
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                    
                                    Text(article.title)
                                        .font(.custom("Arial", size: 22))
                                        .foregroundColor(.white)
                                }
                                
                                Spacer() // will push everything to the left
                                
                                URLImage(URL(string: article.imageURL)!, content: {
                                    
                                    $0.image.resizable()
                                    
                                }).frame(width: 100, height: 100)
                            }
                        }
                    }.frame( maxWidth: .infinity)
                }
                
            
        }.frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(20)
        
        
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(title: "News Title", imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg", publication: "The WallStreet Journal")
        
        return NewsArticleView(newsArticles: [NewsArticleViewModel(article: article)], onDragBegin: {_ in}, onDragEnd: {_ in})
    }
}
