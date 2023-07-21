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
    func list() -> AnyPublisher<PaginatedBaseArrayResponse<MovieModel>, ErrorResponse>
}

public class MoviesAPI:  BaseAPI<MoviesNetworking>, MoviesAPIProtocol {
    func list() -> AnyPublisher<PaginatedBaseArrayResponse<MovieModel>, ErrorResponse> {
        self.fetchData(target: .list)
    }

}
