//
//  MovieVM.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import Foundation

enum PosterSize: String {
    case w92 = "w92"
    case w154 = "w154"
    case w185 = "w185"
    case w342 = "w342"
    case w500 = "w500"
    case w780 = "w780"
    case original = "original"
}

protocol MovieVMProtocol {
    var id: Int { get }
    var title: String { get }
    var releaseDate: String { get }
    var overview: String { get }
    func posterPath(size: PosterSize) -> String
}

class MovieVM: MovieVMProtocol {
    //MARK: - Properties
    private var movie: MovieModel?
    
    //MARK: - Init
    init(movie: MovieModel?) {
        self.movie = movie
    }
    
    //MARK: - Computed Properties
    var id: Int {
        movie?.id ?? Int()
    }
    
    var title: String {
        movie?.title ?? ""
    }
    
    var releaseDate: String {
        movie?.releaseDate ?? ""
    }
    
    var overview: String {
        movie?.overview ?? ""
    }
    
    //MARK: - Public Methods
    func posterPath(size: PosterSize) -> String {
        var path = movie?.posterPath
        path?.removeFirst()
    
        let posterSize = Server.posterSizes.first { $0 == size.rawValue } ?? ""
        
        return "\(Server.mediaBaseURL)\(posterSize)/\(path ?? "")"
    }
    
}
