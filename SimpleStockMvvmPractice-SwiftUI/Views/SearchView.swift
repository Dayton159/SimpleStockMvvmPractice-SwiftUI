//
//  SearchView.swift
//  SimpleStockMvvmPractice-SwiftUI
//
//  Created by Dayton on 16/05/21.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        
        HStack {
                Spacer()
                Image(systemName: "magnifyingglass")
                TextField("Search", text: self.$searchTerm)
                    .foregroundColor(.primary)
                    .padding(10)
            
                Spacer()
        }.foregroundColor(.secondary)
        
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .padding(10)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchTerm: .constant(""))
    }
}
