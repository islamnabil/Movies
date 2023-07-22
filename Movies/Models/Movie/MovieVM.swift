//
//  MovieVM.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import Foundation

public protocol MovieVMProtocol {
    var id: Int { get }
    var title: String { get }
    var releaseDate: String { get }
    var posterPath: String { get }
    var overview: String { get }
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
    
    var posterPath: String {
        var path = movie?.posterPath
        path?.removeFirst()
        return "\(Server.mediaBaseURL)w500/\(path!)"
    }
    
    var overview: String {
        movie?.overview ?? ""
    }
    
}
