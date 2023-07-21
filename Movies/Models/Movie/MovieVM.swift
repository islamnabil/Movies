//
//  MovieVM.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import Foundation

public protocol MovieVMProtocol {
    var title: String { get }
    var releaseDate: String { get }
}

class MovieVM: MovieVMProtocol {
    //MARK: - Properties
    private var movie: MovieModel?
    
    //MARK: - Init
    init(movie: MovieModel?) {
        self.movie = movie
    }
    
    //MARK: - Computed Properties
    var title: String {
        movie?.title ?? ""
    }
    var releaseDate: String {
        movie?.releaseDate ?? ""
    }
    
}