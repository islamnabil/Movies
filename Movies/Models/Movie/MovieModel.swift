//
//  MovieModel.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import Foundation

class MovieModel: Codable {
    let title: String?
    let releaseDate: String?
    
    private enum CodingKeys : String, CodingKey {
       case title = "original_title"
       case releaseDate = "release_date"
    }
}
