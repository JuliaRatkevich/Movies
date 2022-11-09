//
//  ListRowView.swift
//  Movies
//
//  Created by Yuliya Ratkevcih on 08.11.22.
//

import SwiftUI

struct ListRowView: View {
    let movie: MovieModel
    
    var body: some View {
        HStack(spacing: 30) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w92\(movie.poster)"))
            VStack {
                Text(movie.title)
                Text(movie.releaseDate)
                Divider()
                Text(movie.overview)
            }
        }
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(movie: MovieModel(id: 7, title: "title", releaseDate: "9898", overview: "lkj", poster: "tyyy"))
    }
}
