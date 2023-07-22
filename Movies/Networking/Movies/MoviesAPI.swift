//
//  MoviesAPI.swift
//  Movies
//
//  Created by Islam Elgaafary on 21/07/2023.
//

import Foundation
import Alamofire
import Combine

protocol MoviesAPIProtocol {
    func list(page: Int) -> AnyPublisher<PaginatedBaseArrayResponse<MovieModel>, ErrorResponse>
}

public class MoviesAPI:  BaseAPI<MoviesNetworking>, MoviesAPIProtocol {
    func list(page: Int) -> AnyPublisher<PaginatedBaseArrayResponse<MovieModel>, ErrorResponse> {
        fetchData(target: .list(page: page))
    }
    
}
