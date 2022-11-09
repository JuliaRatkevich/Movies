//
//  APIListService.swift
//  Movies
//
//  Created by Yuliya Ratkevcih on 08.11.22.
//

import Foundation

final class APIListService: ListService {
    enum APIError: Error {
        case invalidURL
        case invalidResponse
        
    }
    
    func load(query: String, page: Int) async throws -> [MovieModel] {
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=2696829a81b1b5827d515ff121700838&query=\(query)&page=\(page)") else {
            throw APIError.invalidURL
        }
        
        let result = try await URLSession.shared.data(from: url)
        
        guard let response = result.1 as? HTTPURLResponse, response.statusCode == 200
        else {
            throw APIError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        let moviesResult = try decoder.decode(MoviesResult.self, from: result.0)
        return moviesResult.results
        
        
    }
    
    
}
