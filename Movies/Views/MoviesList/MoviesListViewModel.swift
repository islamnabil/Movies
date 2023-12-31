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
    var page: Int { get set }
    var totalPages: Int { get }
    func fetchConfiguration()
    func fetchTrendingMovies()
}

class MoviesListViewModel: MoviesListViewModelProtocol {
    
    enum MoviesListPageState: Equatable {
        case loading
        case showAPIError(message: String)
        case successed
    }
    
    // MARK: - Init
    init(configurationProvider: ConfigurationAPIProtocol, moviesProvider: MoviesAPIProtocol) {
        self.configurationProvider = configurationProvider
        self.moviesProvider = moviesProvider
    }
    
    // MARK: - Proprties
    @Published var movies: [MovieVMProtocol] = []
    @Published var state: MoviesListPageState = .loading
    var page: Int = 1
    var totalPages: Int = 1
    private var bindings = Set<AnyCancellable>()
    private var moviesProvider: MoviesAPIProtocol?
    private var configurationProvider: ConfigurationAPIProtocol?
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
    func fetchConfiguration() {
        configurationProvider?.configuration()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: requestCompletionHandler) { [weak self] in
                if let results = $0.images, let baseURL = results.secureBaseUrl, let posterSizes = results.posterSizes {
                    Server.mediaBaseURL =  baseURL
                    Server.posterSizes = posterSizes
                    self?.fetchTrendingMovies()
                }
            }
            .store(in: &bindings)
    }
    
    func fetchTrendingMovies() {
        if page <= totalPages {
            moviesProvider?.list(page: page)
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: requestCompletionHandler) { [weak self] in
                    if let results = $0.results, let totalPages = $0.totalPages {
                        if self?.page == 1 {
                            self?.movies = results.map({ MovieVM(movie: $0) })
                        } else {
                            self?.movies.append(contentsOf: results.map({ MovieVM(movie: $0) }))
                        }
                        self?.totalPages = totalPages
                        self?.page += 1
                    }
                }
                .store(in: &bindings)
        }
    }
}
