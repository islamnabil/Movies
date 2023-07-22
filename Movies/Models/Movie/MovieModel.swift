//
//  MovieModel.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import Foundation

class MovieModel: Codable {
    let id: Int?
    let title: String?
    let releaseDate: String?
    let posterPath: String?
    
    private enum CodingKeys : String, CodingKey {
       case id
       case title = "original_title"
       case releaseDate = "release_date"
       case posterPath = "poster_path"
    }
    
    internal init(id: Int? = nil, title: String? = nil, releaseDate: String? = nil, posterPath: String? = nil) {
        self.id = id
        self.title = title
        self.releaseDate = releaseDate
        self.posterPath = posterPath
    }
}
