//
//  Constants.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import Foundation


struct Server {
    static let productionURL = "https://api.themoviedb.org/3/"
    static let stagingURL = "https://api.themoviedb.org/3/"
    
    static var baseURL: String {
        return productionURL
    }
}
