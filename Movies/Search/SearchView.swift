//
//  SearchView.swift
//  Movies
//
//  Created by Yuliya Ratkevcih on 08.11.22.
//

import SwiftUI

struct SearchView: View {
    @State private var query: String = ""
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Query", text: $query)
                NavigationLink(destination: ListView(query: query) , isActive: $isActive) {
                    Button("search") {
                        isActive = true
                    }
                }
            }
            .padding()
        }
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
