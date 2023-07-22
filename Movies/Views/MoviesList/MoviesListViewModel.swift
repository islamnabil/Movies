//
//  MoviesListViewModel.swift
//  Movies
//
//  Created by Islam Elgaafary on 22/07/2023.
//

import Foundation
import Combine

protocol MoviesListViewModelProtocol: ObservableObject {
    var state: MoviesListViewModel.MoviesListPageState { get }
    var movies: [MovieVMProtocol] { get }
    func fetchTrendingMovies()
}

class MoviesListViewModel: MoviesListViewModelProtocol {
    
    enum MoviesListPageState: Equatable {
        case loading
        case showAPIError(message: String)
        case successed
    }
    
    // MARK: - Init
    init(provider: MoviesAPIProtocol) {
        self.provider = provider
    }
    
    // MARK: - Proprties
    @Published var movies: [MovieVMProtocol] = []
    @Published var state: MoviesListPageState = .loading
    private var bindings = Set<AnyCancellable>()
    private var provider: MoviesAPIProtocol?
    lazy var requestCompletionHandler: (Subscribers.Completion<ErrorResponse>) -> Void = { completion in
        switch completion {
        case .failure(let error):
            print(error.msg ?? "")
            self.state = .loading
        case .finished:
            print("Finished")
        }
    }
    
    // MARK: - Public Methods
    func fetchTrendingMovies() {
        provider?.list()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: requestCompletionHandler) { [weak self] in
                if let results = $0.results {
                    self?.movies = results.map({ MovieVM(movie: $0) })
                }
            }
            .store(in: &bindings)
    }
    
}
