//
//  ListService.swift
//  Movies
//
//  Created by Yuliya Ratkevcih on 08.11.22.
//

import Foundation

protocol ListService {
    func load(query: String, page: Int) async throws -> [MovieModel]
}
