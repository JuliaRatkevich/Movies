//
//  ListViewModel.swift
//  Movies
//
//  Created by Yuliya Ratkevcih on 08.11.22.
//

import Foundation

final class ListViewModel: ObservableObject {
    enum State {
        case loading
        case failure
        case loaded([MovieModel])
    }
    
    private let service: ListService
    @Published var state: State
    
    
    
    
    init(service: ListService) {
        self.service = service
        self.state = State.loading
    }
    
    
    func loadData(query: String) {
        Task {
            do {
                let movies = try await service.load(query: query, page: 1)
                DispatchQueue.main.async {
                    self.state = State.loaded(movies)
                }
                
            } catch {
                print(error)
                DispatchQueue.main.async {
                    self.state = State.failure
                }
                
                
            }
            
        }
        
    }
    
}
