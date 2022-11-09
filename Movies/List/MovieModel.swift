//
//  MovieModel.swift
//  Movies
//
//  Created by Yuliya Ratkevcih on 08.11.22.
//

import Foundation

struct MoviesResult: Decodable {
    let results: [MovieModel]
}

struct MovieModel: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case overview
        case poster = "poster_path"
    }
    
    let id: Int
    let title: String
    let releaseDate: String
    let overview: String
    let poster: String
}
