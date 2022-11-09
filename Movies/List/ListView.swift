//
//  ListView.swift
//  Movies
//
//  Created by Yuliya Ratkevcih on 08.11.22.
//

import SwiftUI

struct ListView: View {
    private var query: String
    
    @ObservedObject private var viewModel: ListViewModel = ListViewModel(service: APIListService())
    
    init(query: String) {
        self.query = query
    }
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            loadingView
                .onAppear {
                    viewModel.loadData(query: query)
                }
        case .failure:
            failureView
        case .loaded(let movies):
            List(movies) {
                      ListRowView(movie: $0)
            }
            .listStyle(.plain)
            .padding()
        }
    }
    
    var failureView: some View {
        VStack {
            Text("❌")
            Text("Something went wrong")
        }
        .padding()
    }
    
    
    var loadingView: some View {
        ProgressView()
    }
}



struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(query: "Batman")
    }
}
